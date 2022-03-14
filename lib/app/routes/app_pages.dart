import 'package:get/get.dart';

import '../modules/ListComptesRendus/bindings/list_comptes_rendus_binding.dart';
import '../modules/ListComptesRendus/views/list_comptes_rendus_view.dart';
import '../modules/Rendezvous/views/rendezvous_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/views/login_view.dart';
import '../modules/radio/views/radio_view.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

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
  ];
}
