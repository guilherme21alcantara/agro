import 'package:culturas_new/app/data/db/migrations/migrations.createAtividades.dart';
import 'package:culturas_new/app/data/db/my_database.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'atividade_dao.g.dart';

@UseDao(tables: [
  TableAtividade,
  TableMaquina,
  TableInsumo,
  TableColaborador,
  TableFazenda
])
class AtividadeDAO extends DatabaseAccessor<MyDataBase>
    with _$AtividadeDAOMixin {
  Stream<List<TableAtividadeData>> listAll() {
    return select(tableAtividade).watch();
  }

  Future<TableAtividadeData?> getAtividadePorID(String idAtividade) {
    return (select(tableAtividade)..where((tbl) => tbl.id.equals(idAtividade)))
        .getSingleOrNull();
  }

  Future<TableFazendaData?> getFazendaAtividade(String idFazenda) {
    return (select(tableFazenda)..where((tbl) => tbl.id.equals(idFazenda)))
        .getSingleOrNull();
  }

  Future<TableMaquinaData?> getMaquinaAtividade(String idMaquina) {
    return (select(tableMaquina)..where((tbl) => tbl.id.equals(idMaquina)))
        .getSingleOrNull();
  }

  Future<TableInsumoData?> getInsumoAtividade(String idInsumo) {
    return (select(tableInsumo)..where((tbl) => tbl.id.equals(idInsumo)))
        .getSingleOrNull();
  }

  Future<TableColaboradorData?> getColaboradorAtividade(String idColaborador) {
    return (select(tableColaborador)
          ..where((tbl) => tbl.id.equals(idColaborador)))
        .getSingleOrNull();
  }

  sincronizarMaquinas(List<TableMaquinaData?> listaMaquinas) {
    if (listaMaquinas.length > 0) {
      listaMaquinas.forEach((maquina) async {
        if (await AtividadeDAO(db).getMaquinaAtividade(maquina!.id) != null) {
          await update(tableMaquina).replace(maquina);
        } else {
          await into(tableMaquina).insert(maquina);
        }
      });
    }
  }

  sincronizarAtividade(
    TableAtividadeData atividade,
    TableFazendaData? fazenda,
    List<TableMaquinaData?> listaMaquinas,
    List<TableInsumoData?> listaInsumos,
  ) async {
    //Caso exista fazenda relacionada
    if (fazenda != null) {
      if (await AtividadeDAO(db).getFazendaAtividade(fazenda.id) != null) {
        await update(tableFazenda).replace(fazenda);
      } else {
        await into(tableFazenda).insert(fazenda);
      }
    }

    //Caso existam maquinas relacionadas
    await sincronizarMaquinas(listaMaquinas);

    //Caso existam maquinas relacionadas
    if (listaInsumos.length > 0) {
      listaInsumos.forEach((insumo) async {
        if (await AtividadeDAO(db).getInsumoAtividade(insumo!.id) != null) {
          await update(tableInsumo).replace(insumo);
        } else {
          await into(tableInsumo).insert(insumo);
        }
      });
    }

    /**
     * Todo 
     * Faltam sincronizar colaboradores
     */

    //Adiciona ou atualiza atividade
    if (await AtividadeDAO(db).getAtividadePorID(atividade.id) != null) {
      await update(tableAtividade).replace(atividade);
    } else {
      await into(tableAtividade).insert(atividade);
    }
  }

  addAtividade(TableAtividadeData data) {
    return into(tableAtividade).insert(data);
  }

  addFazenda(TableFazendaData data) {
    return into(tableFazenda).insert(data);
  }

  addMaquina(TableMaquinaData data) {
    return into(tableMaquina).insert(data);
  }

  addInsumo(TableInsumoData data) {
    return into(tableInsumo).insert(data);
  }

  addColaborador(TableColaboradorData data) {
    return into(tableColaborador).insert(data);
  }

  updateAtividade(TableAtividadeData data) {
    return update(tableAtividade).replace(data);
  }

  deleteAtividade(id) {
    return (delete(tableAtividade)..where((tbl) => tbl.id.equals(id))).go();
  }

  AtividadeDAO(MyDataBase db) : super(db);
}
