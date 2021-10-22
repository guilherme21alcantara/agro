import 'package:moor_flutter/moor_flutter.dart';

class TablePlantio extends Table {
  IntColumn? get id => integer()();
  TextColumn? get talhao => text()();
  TextColumn? get nomeFazenda => text()();
  RealColumn? get areaEmHectares => real()();
  RealColumn? get areaAtrasado => real()();
  RealColumn? get areaExecutado => real()();
}
