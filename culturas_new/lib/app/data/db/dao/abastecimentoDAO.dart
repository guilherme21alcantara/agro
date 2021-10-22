import 'package:culturas_new/app/data/db/migrations/migrations.createAbastecimento.dart';
import 'package:culturas_new/app/data/db/my_database.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'abastecimentoDAO.g.dart';

@UseDao(tables: [TableAbastecimento])
class AbastecimentoDAO extends DatabaseAccessor<MyDataBase>
    with _$AbastecimentoDAOMixin {
  Stream<List<TableAbastecimentoData>> listAll() {
    return select(tableAbastecimento).watch();
  }

  addAbastecimento(TableAbastecimentoData abastecimento) {
    return into(tableAbastecimento).insert(abastecimento);
  }

  updateAbastecimento(TableAbastecimentoData abastecimento) {
    return (update(tableAbastecimento)
          ..where((tbl) => tbl.id.equals(abastecimento.id)))
        .write(abastecimento);
  }

  deleteAbastecimento(id) {
    return (delete(tableAbastecimento)..where((tbl) => tbl.id.equals(id))).go();
  }

  AbastecimentoDAO(MyDataBase db) : super(db);
}
