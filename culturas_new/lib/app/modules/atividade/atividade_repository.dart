import 'dart:convert';

import 'package:culturas_new/app/data/db/dao/atividade_dao.dart';
import 'package:culturas_new/app/data/db/my_database.dart';
import 'package:culturas_new/app/data/models/atividade.model.dart';
import 'package:culturas_new/app/data/models/fazenda.model.dart';
import 'package:culturas_new/app/data/models/maquina.model.dart';

import '/app/data/providers/api.dart';

class AtividadeRepository {
  final MyApi api;
  final db = MyDataBase.instance;

  AtividadeRepository(this.api);

  Future<List<Atividade>> sincronizar() async {
    //Sincronizar todas as maquinas
    MaquinaModel maquinasModel = await api.getRegistrosMaquinas();

    if (maquinasModel.maquinas != null) {
      final maquinasData =
          Maquina.toListTableData(maquinasModel.maquinas ?? []);
      await AtividadeDAO(db).sincronizarMaquinas(maquinasData);
    }

    AtividadeModel atividadesModelList = await api.getRegistrosAtividades();

    atividadesModelList.atividades!.forEach((atividadeAPI) async {
      try {
        final atividadeData = TableAtividadeData(
          id: atividadeAPI.id!,
          atividade: atividadeAPI.atividade ?? 'Atividade não informada',
          data: DateTime.now(),
          idFazenda: atividadeAPI.fazenda!.id!,
          cultura: atividadeAPI.cultura ?? '',
          area: atividadeAPI.area ?? '0.0',
          subArea: atividadeAPI.subArea ?? '0.0',
          safra: atividadeAPI.safra ?? '',
          areaEmHectares: atividadeAPI.areaEmHectares ?? 0.0,
          perimetro: atividadeAPI.id!,
          status: atividadeAPI.status!,
          isSincronizadoAPI: true,
          idMaquinas: json.encode(
            atividadeAPI.maquinas!.map((m) => m.maquinaId).toList(),
          ),
          idInsumos: json.encode(
            atividadeAPI.insumos!.map((i) => i.insumoId).toList(),
          ),
          idColaboradores: json.encode(
            atividadeAPI.colaboradores!.map((c) => c.colaboradorId).toList(),
          ),
          //telemetria: "a",
          //paradas: "a",
        );

        final fazendaData = atividadeAPI.fazenda == null
            ? null
            : TableFazendaData(
                id: atividadeAPI.fazenda!.id!,
                nome: atividadeAPI.fazenda!.nome!,
                codigoParceiro: atividadeAPI.fazenda!.codigoParceiro!,
                idColaboradores: "[]",
              );

        //Sincroniza maquinas das atividades
        final maquinasListaData = <TableMaquinaData>[];

        if (atividadeAPI.maquinas != null) {
          maquinasListaData.addAll(
            MaquinaAtividade.toListTableData(atividadeAPI.maquinas ?? []),
          );
        }

        final insumoListaData = <TableInsumoData>[];

        if (atividadeAPI.insumos != null) {
          atividadeAPI.insumos!.forEach((insumo) {
            insumoListaData.add(
              TableInsumoData(
                id: insumo.insumoId!,
                descricao: insumo.descricao ?? '',
                quantidade: insumo.quantidade!,
                unidade: insumo.unidade!,
              ),
            );
          });
        }

        await AtividadeDAO(db).sincronizarAtividade(
          atividadeData,
          fazendaData,
          maquinasListaData,
          insumoListaData,
        );
      } catch (e) {
        print("Error:");
        print(e);
      }
    });

    return atividadesModelList.atividades!;
  }

  Future<List<Atividade>> listarAtividades() async {
    List<Atividade> atividades = [];
    List<TableAtividadeData> listaAtividadesBanco =
        await AtividadeDAO(db).listAll().first;

    if (listaAtividadesBanco.isNotEmpty) {
      await Future.forEach(listaAtividadesBanco,
          (TableAtividadeData tableAtividadeData) async {
        List<MaquinaAtividade> listaMaquinas = [];

        await Future.forEach(
          json.decode(tableAtividadeData.idMaquinas),
          (dynamic idMaquina) async {
            try {
              TableMaquinaData? tableMaquinaData =
                  await AtividadeDAO(db).getMaquinaAtividade(idMaquina);

              if (tableMaquinaData != null) {
                listaMaquinas.add(
                  MaquinaAtividade(
                    maquinaId: tableMaquinaData.id,
                    descricao: tableMaquinaData.descricao,
                  ),
                );
              }
            } catch (e) {
              print("[ERROR]: parse maquina");
              print(e);
            }
          },
        );

        List<InsumoAtividade> listaInsumos = [];

        await Future.forEach(
          json.decode(tableAtividadeData.idInsumos),
          (dynamic idInsumo) async {
            try {
              TableInsumoData? tableInsumoData =
                  await AtividadeDAO(db).getInsumoAtividade(idInsumo);

              if (tableInsumoData != null) {
                listaInsumos.add(
                  InsumoAtividade(
                    insumoId: tableInsumoData.id,
                    descricao: tableInsumoData.descricao,
                    quantidade: tableInsumoData.quantidade,
                    unidade: tableInsumoData.unidade,
                  ),
                );
              }
            } catch (e) {
              print("[ERROR]: parse insumo");
              print(e);
            }
          },
        );

        List<ColaboradorAtividade> listaColaboradores = [];

        await Future.forEach(
          json.decode(tableAtividadeData.idColaboradores),
          (dynamic idColaborador) async {
            try {
              TableColaboradorData? tableColaboradorData =
                  await AtividadeDAO(db).getColaboradorAtividade(idColaborador);

              if (tableColaboradorData != null) {
                listaColaboradores.add(ColaboradorAtividade(
                    colaboradorId: tableColaboradorData.id,
                    nome: tableColaboradorData.nome));
              }
            } catch (e) {
              print("[ERROR]: parse colaborador");
              print(e);
            }
          },
        );

        Fazenda? fazenda;

        try {
          TableFazendaData? tableFazendaData = await AtividadeDAO(db)
              .getFazendaAtividade(tableAtividadeData.idFazenda);

          fazenda = Fazenda(
            id: tableFazendaData!.id,
            nome: tableFazendaData.nome,
            codigoParceiro: tableFazendaData.codigoParceiro,
            colaboradores: listaColaboradores,
          );
        } catch (e) {
          print("[ERROR]: parse fazenda");
          print(e);
        }

        atividades.add(
          Atividade(
            id: tableAtividadeData.id,
            atividade: tableAtividadeData.atividade,
            data: tableAtividadeData.data,
            fazenda: fazenda,
            cultura: tableAtividadeData.cultura,
            area: tableAtividadeData.area,
            subArea: tableAtividadeData.subArea,
            safra: tableAtividadeData.safra,
            areaEmHectares: tableAtividadeData.areaEmHectares,
            perimetro: tableAtividadeData.perimetro,
            status: tableAtividadeData.status,
            isSincronizadoAPI: tableAtividadeData.isSincronizadoAPI,
            maquinas: listaMaquinas,
            insumos: listaInsumos,
            colaboradores: listaColaboradores,
          ),
        );
      });
    }

    return atividades;
  }
}
