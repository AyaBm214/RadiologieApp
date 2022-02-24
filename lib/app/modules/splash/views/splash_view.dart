import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:radiologiev2/app/modules/home/views/home_view.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {});
    Get.to(HomeView());
  }

  @override
  Widget build(BuildContext context) {
    _navigatetohome();
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Image.asset("assets/images/logo2.png",height: 200,
          width: 300,),

      ),
    );
  }
}

