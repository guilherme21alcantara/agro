import 'package:culturas_new/app/data/db/migrations/migration.createPluviametria.dart';
import 'package:culturas_new/app/data/db/my_database.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'pluviametriaDAO.g.dart';

@UseDao(tables: [TablePluviametria])
class PluviametriaDAO extends DatabaseAccessor<MyDataBase>
    with _$PluviametriaDAOMixin {
  Stream<List<TablePluviametriaData>> listAll() {
    return select(tablePluviametria).watch();
  }

  addpluviametria(TablePluviametriaData data) {
    return into(tablePluviametria).insert(data);
  }

  updatepluviametria(TablePluviametriaData data) {
    return update(tablePluviametria).replace(data);
  }

  deletepluviametria(id) {
    return (delete(tablePluviametria)..where((tbl) => tbl.id.equals(id))).go();
  }

  PluviametriaDAO(MyDataBase db) : super(db);
}
