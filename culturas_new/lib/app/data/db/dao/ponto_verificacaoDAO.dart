import 'package:culturas_new/app/data/db/migrations/migrations.createVerificacao.dart';
import 'package:culturas_new/app/data/db/my_database.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'ponto_verificacaoDAO.g.dart';

@UseDao(tables: [TableTalhao, TablePontoVerificacao])
class TalhaoDAO extends DatabaseAccessor<MyDataBase> with _$TalhaoDAOMixin {
  Stream<List<TableTalhaoData>> listAll() {
    return select(tableTalhao).watch();
  }

  Future<List<TablePontoVerificacaoData>> getPontosVerificacaoTalhao(
      int idTalhao) {
    return (select(tablePontoVerificacao)
          ..where((tbl) => tbl.idTalhao.equals(idTalhao)))
        .get();
  }

  addTalhao(TableTalhaoData data) {
    return into(tableTalhao).insert(data);
  }

  addPontoVerificacao(TablePontoVerificacaoData data) {
    return into(tablePontoVerificacao).insert(data);
  }

  updateTalhao(TableTalhaoData data) {
    return update(tableTalhao).replace(data);
  }

  updatePontoVerificacao(TablePontoVerificacaoData data) {
    return update(tablePontoVerificacao).replace(data);
  }

  deleteTalhao(id) {
    return (delete(tableTalhao)..where((tbl) => tbl.id.equals(id))).go();
  }

  TalhaoDAO(MyDataBase db) : super(db);
}
