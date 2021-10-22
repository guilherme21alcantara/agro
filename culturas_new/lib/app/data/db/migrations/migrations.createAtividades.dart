import 'package:moor_flutter/moor_flutter.dart';

class TableAtividade extends Table {
  TextColumn get id => text()();
  TextColumn? get atividade => text()();
  DateTimeColumn? get data => dateTime()();
  TextColumn? get idFazenda => text()();
  TextColumn? get cultura => text()();
  TextColumn? get area => text()();
  TextColumn? get subArea => text()();
  TextColumn? get safra => text()();
  RealColumn? get areaEmHectares => real()();
  TextColumn? get perimetro => text()();
  IntColumn? get status => integer()();
  BoolColumn get isSincronizadoAPI => boolean()();
  // List from JSON
  TextColumn? get idMaquinas => text()();
  TextColumn? get idInsumos => text()();
  TextColumn? get idColaboradores => text()();
  TextColumn? get telemetria => text().nullable()();
  TextColumn? get paradas => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class TableMaquina extends Table {
  TextColumn get id => text()();
  TextColumn? get descricao => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class TableInsumo extends Table {
  TextColumn get id => text()();
  TextColumn? get descricao => text()();
  RealColumn? get quantidade => real()();
  TextColumn? get unidade => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class TableColaborador extends Table {
  TextColumn get id => text()();
  TextColumn? get nome => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class TableFazenda extends Table {
  TextColumn get id => text()();
  TextColumn? get nome => text()();
  TextColumn? get codigoParceiro => text()();
  // JSON array de String
  TextColumn? get idColaboradores => text()();

  @override
  Set<Column> get primaryKey => {id};
}
