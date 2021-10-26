import 'package:moor_flutter/moor_flutter.dart';

class TableTalhao extends Table {
  IntColumn? get id => integer().autoIncrement()();
  TextColumn? get nome => text()();
  // Json
  TextColumn? get geometria => text()();
  // Json Foreign Keys
  TextColumn? get pontosVerificacao => text()();
  DateTimeColumn? get createAt => dateTime()();
  DateTimeColumn? get updateAt => dateTime()();
}

class TablePontoVerificacao extends Table {
  IntColumn? get id => integer().autoIncrement()();
  // Key
  IntColumn? get idTalhao => integer()();
  RealColumn? get latitude => real()();
  RealColumn? get longitude => real()();
  DateTimeColumn? get dataVerificacao => dateTime().nullable()();
  TextColumn? get foto => text().nullable()();
  BoolColumn? get isPendente => boolean()();
  TextColumn? get observacao => text().nullable()();
  DateTimeColumn? get createAt => dateTime()();
  DateTimeColumn? get updateAt => dateTime()();
  TextColumn? get praga => text().nullable()();
  TextColumn? get amostragem => text().nullable()();
  TextColumn? get fase => text().nullable()();
  TextColumn? get intensidade => text().nullable()();
  TextColumn? get estrago => text().nullable()();
  // TextColumn? get observacoes => text().nullable()();
}
