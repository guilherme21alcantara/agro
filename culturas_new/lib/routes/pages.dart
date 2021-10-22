import 'package:culturas_new/app/modules/abastecimento/abastecimento_screem.dart';
import 'package:culturas_new/app/modules/abastecimento/bindings.dart';
import 'package:culturas_new/app/modules/consolidacao/bindings.dart';
import 'package:culturas_new/app/modules/consolidacao/view.dart';
import 'package:culturas_new/app/modules/indicadores/indicadores_binding.dart';
import 'package:culturas_new/app/modules/indicadores/indicadores_screem.dart';
import 'package:culturas_new/app/modules/monitoramento/monitoramento_binding.dart';
import 'package:culturas_new/app/modules/monitoramento/planta_screem.dart';
import 'package:culturas_new/app/modules/monitoramento/solo_screem.dart';
import 'package:culturas_new/app/modules/pluviometro/pluviometro_binding.dart';
import 'package:culturas_new/app/modules/pluviometro/pluviometro_screem.dart';
import 'package:get/get.dart';
//project
import '/app/modules/auth/auth_binding.dart';
import '../app/modules/auth/auth_screem.dart';
import '/app/modules/atividade/atividade_binding.dart';
import '/app/modules/atividade/atividades_screem.dart';
import '/app/modules/configuracoes/configuracoes_binding.dart';
import '/app/modules/configuracoes/configuracoes_screem.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
        name: Routes.ATIVIDADES,
        page: () => AtividadesScreem(),
        binding: AtividadeBinding()),
    GetPage(
        name: Routes.CONFIGURACOES,
        page: () => ConfiguracoesScreem(),
        binding: ConfiguracoesBinding()),
    GetPage(
        name: Routes.INDICADORES,
        page: () => Indicadoresscreem(),
        binding: IndicadoresBinding()),
    GetPage(
        name: Routes.PLUVIAMETRIA,
        page: () => PluviometroScreem(),
        binding: PluviometroBinding()),
    GetPage(
        name: Routes.ABASTECIMENTO,
        page: () => AbastecimentoScreem(),
        binding: AbastecimentoBinding()),
    GetPage(
        name: Routes.CONSOLIDACAO,
        page: () => ConsolidacaoScreem(),
        binding: ConsolidacaoBinding()),
    GetPage(
      name: Routes.PLANTA,
      page: () => plantaMonitoramentoScreem(),
    ),
    GetPage(name: Routes.SOLO, page: () => soloMonitoramentoScreem())
  ];
}
