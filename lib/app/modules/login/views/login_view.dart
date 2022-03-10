import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radiologiev2/app/modules/login/views/theme.dart';
import 'package:radiologiev2/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

// ignore: must_be_immutable
class LoginView extends GetView<LoginController> {
  LoginController loginController = Get.put(LoginController());

  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login to your\naccount',
                  style: heading2.copyWith(color: textBlack),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 48,
            ),
            Form(
              key: controller.loginFormKey,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: textWhiteGrey,
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: TextFormField(
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: heading6.copyWith(color: textGrey),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: controller.validator,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: textWhiteGrey,
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: TextFormField(
                      controller: controller.passwordController,
                      obscureText: !passwordVisible,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: heading6.copyWith(color: textGrey),
                        suffixIcon: IconButton(
                          color: textGrey,
                          splashRadius: 1,
                          icon: Icon(passwordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined),
                          onPressed: () {},
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: controller.validator,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            const SizedBox(
              height: 32,
            ),
            Center(
                child: ElevatedButton(
              child: const Text('Login'),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size((250), (50)),
                primary: Colors.indigo,
                onPrimary: Colors.white,
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              onPressed: () {
                controller.login();
              },
            )),
            Center(
              child: Text(
                'OR',
                style: heading6.copyWith(color: textBlack),
              ),
            ),
            Center(
                child: ElevatedButton(
              child: const Text('Change clinique'),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size((250), (50)),
                primary: Colors.indigo,
                onPrimary: Colors.white,
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              ),
              onPressed: () {
                Get.offAndToNamed(Routes.HOME);
              },
            )),
          ]),
        ),
      ),
    );
  }
}
