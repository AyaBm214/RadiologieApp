import 'package:get/get.dart';

import '../modules/Acceuil/Radio/bindings/radio_binding.dart';
import '../modules/Acceuil/Radio/views/radio_view.dart';
import '../modules/Acceuil/Rendezvous/bindings/rendezvous_binding.dart';
import '../modules/Acceuil/Rendezvous/views/rendezvous_view.dart';
import '../modules/Acceuil/bindings/acceuil_binding.dart';
import '../modules/Acceuil/views/acceuil_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ACCEUIL;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ACCEUIL,
      page: () => AcceuilView(),
      binding: AcceuilBinding(),
      children: [
        GetPage(
          name: _Paths.RADIO,
          page: () => RadioView(),
          binding: RadioBinding(),
        ),
        GetPage(
          name: _Paths.RENDEZVOUS,
          page: () => RendezvousView(),
          binding: RendezvousBinding(),
        ),
      ],
    ),
  ];
}
