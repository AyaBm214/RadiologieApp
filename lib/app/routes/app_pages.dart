import 'package:get/get.dart';

import '../modules/Acceuil/Rendezvous/views/rendezvous_view.dart';
import '../modules/Acceuil/radio/bindings/radio_binding.dart';
import '../modules/Acceuil/radio/views/radio_view.dart';
import '../modules/Acceuil/views/acceuil_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/views/login_view.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ACCEUIL;

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
      name: _Paths.ACCEUIL,
      page: () => AcceuilView(),
    ),

        GetPage(
          name: _Paths.RADIO,
          page: () => RadioView(),
          binding: RadioBinding(),
        ),
    GetPage(
      name: _Paths.RENDEZVOUS,
      page: () => RendezvousView(),
    ),
  ];
}
