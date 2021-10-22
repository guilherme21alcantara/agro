import 'package:moor_flutter/moor_flutter.dart';

class TableAbastecimento extends Table {
  IntColumn? get id => integer()();
  TextColumn? get oleo => text()();
  TextColumn? get idMaquina => text()();
  TextColumn? get nomeMaquina => text()();
  TextColumn? get idFazenda => text()();
  TextColumn? get nomeFazenda => text()();
  TextColumn? get fotoOleo => text()();
  TextColumn? get odometro => text()();
  TextColumn? get fotoOdomentro => text()();
  IntColumn? get status => integer()();
  DateTimeColumn? get createAt => dateTime()();
  DateTimeColumn? get updateAt => dateTime()();
}
