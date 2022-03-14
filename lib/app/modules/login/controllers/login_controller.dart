import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radiologiev2/app/data/Services/ServiceUser.dart';
import 'package:radiologiev2/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  ServiceUser apiService = ServiceUser();
  RxBool viewPassWord = true.obs;
  showPassword() => viewPassWord.value = !viewPassWord.value;

  String? validator(String? value) {
    if (value!.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

  void onBackPressed() {
    Get.to(Routes.HOME);
  }

  void login() {
    if (loginFormKey.currentState!.validate()) {
      ServiceUser.username = emailController.text;
      ServiceUser.password = passwordController.text;
      apiService.login().then((value) {
        print(ServiceUser.token);
        if (ServiceUser.token == "200") {
          Get.snackbar('Login', 'Login successfully',
              snackPosition: SnackPosition.TOP);
          Get.toNamed(Routes.ACCEUIL);
        } else {
          Get.snackbar('Login', 'Invalid email or password',
              snackPosition: SnackPosition.TOP);
        }
      });

      passwordController.clear();
    }
  }

  Future<bool> checkClinique(String user, String password) {
    if (user == '' && password == '') {
      return Future.value(true);
    }
    return Future.value(false);
  }
}
