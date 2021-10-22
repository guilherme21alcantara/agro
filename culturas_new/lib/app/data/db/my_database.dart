import 'package:culturas_new/app/data/db/dao/atividade_dao.dart';
import 'package:culturas_new/app/data/db/dao/pluviametriaDAO.dart';
import 'package:culturas_new/app/data/db/migrations/migration.createPlantio.dart';
import 'package:culturas_new/app/data/db/migrations/migrations.createVerificacao.dart';
import 'package:moor_flutter/moor_flutter.dart';

import 'dao/ponto_verificacaoDAO.dart';
import 'migrations/migration.createPluviametria.dart';
import 'migrations/migrations.createAbastecimento.dart';
import 'migrations/migrations.createAtividades.dart';
import 'dao/abastecimentoDAO.dart';

part 'my_database.g.dart';

@UseMoor(tables: [
  TableAtividade,
  TableMaquina,
  TableInsumo,
  TableColaborador,
  TableAbastecimento,
  TablePluviametria,
  TableTalhao,
  TablePontoVerificacao,
  TableFazenda,
  TablePlantio
])
class MyDataBase extends _$MyDataBase {
  static MyDataBase instance = MyDataBase._internal();

  //instaciar os modelos de classe
  late AbastecimentoDAO abastecimentoDAO;
  late PluviametriaDAO pluviametriaDAO;
  late TalhaoDAO talhaoDAO;
  late AtividadeDAO atividadeDAO;

  MyDataBase._internal()
      : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite')) {
    abastecimentoDAO = AbastecimentoDAO(this);
    pluviametriaDAO = PluviametriaDAO(this);
    talhaoDAO = TalhaoDAO(this);
    atividadeDAO = AtividadeDAO(this);
  }

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 25;

  @override
  MigrationStrategy get migration => MigrationStrategy(onCreate: (Migrator m) {
        return m.createAll();
      }, onUpgrade: (Migrator m, int from, int to) async {
        if (from == 23) {
          m.deleteTable("table_atividade");
          return m.createAll();
        }
      });
}
