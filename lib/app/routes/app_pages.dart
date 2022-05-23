import 'package:get/get.dart';

import '../modules/Bloc/bindings/bloc_binding.dart';
import '../modules/Bloc/views/bloc_view.dart';
import '../modules/Dicter/bindings/dicter_binding.dart';
import '../modules/Dicter/views/dicter_view.dart';
import '../modules/Exploitation/bindings/exploitation_binding.dart';
import '../modules/Exploitation/views/exploitation_view.dart';
import '../modules/ListComptesRendus/bindings/list_comptes_rendus_binding.dart';
import '../modules/ListComptesRendus/views/list_comptes_rendus_view.dart';
import '../modules/Pdf/bindings/pdf_binding.dart';
import '../modules/Pdf/views/pdf_view.dart';
import '../modules/Player/bindings/player_binding.dart';
import '../modules/Player/views/player_view.dart';
import '../modules/Rendezvous/views/rendezvous_view.dart';
import '../modules/Viewer/bindings/viewer_binding.dart';
import '../modules/Viewer/views/viewer_view.dart';
import '../modules/detailsCompteRendu/bindings/details_compte_rendu_binding.dart';
import '../modules/detailsCompteRendu/views/details_compte_rendu_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/views/login_view.dart';
import '../modules/radio/views/radio_view.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
    ),
    GetPage(
      name: _Paths.RADIO,
      page: () => RadioView(),
    ),
    GetPage(
      name: _Paths.RENDEZVOUS,
      page: () => RendezvousView(),
    ),
    GetPage(
      name: _Paths.LIST_COMPTES_RENDUS,
      page: () => ListComptesRendusView(),
      binding: ListComptesRendusBinding(),
    ),
    GetPage(
      name: _Paths.EXPLOITATION,
      page: () => ExplorationView(),
      binding: ExploitationBinding(),
    ),
    GetPage(
      name: _Paths.BLOC,
      page: () => BlocView(),
      binding: BlocBinding(),
    ),
    GetPage(
      name: _Paths.DETAILS_COMPTE_RENDU,
      page: () => DetailsCompteRenduView(),
      binding: DetailsCompteRenduBinding(),
    ),
    GetPage(
      name: _Paths.DICTER,
      page: () => DicterView(),
      binding: DicterBinding(),
    ),
    GetPage(
      name: _Paths.VIEWER,
      page: () => ViewerView(),
      binding: ViewerBinding(),
    ),
    GetPage(
      name: _Paths.PLAYER,
      page: () => PlayerView(),
      binding: PlayerBinding(),
    ),
    GetPage(
      name: _Paths.PDF,
      page: () => PdfView(),
      binding: PdfBinding(),
    ),
  ];
}
