import 'package:moor_flutter/moor_flutter.dart';

class TablePluviametria extends Table {
  IntColumn? get id => integer()();
  TextColumn? get talhao => text()();
  DateTimeColumn? get dateColeta => dateTime()();
  TextColumn? get  milimetro => text()();
  TextColumn? get tempMaxima => text()();
  TextColumn? get temp => text()();
  TextColumn? get obs => text()();
  IntColumn? get status => integer()();
  DateTimeColumn? get createAt => dateTime()();
  DateTimeColumn? get updateAt => dateTime()();
}
