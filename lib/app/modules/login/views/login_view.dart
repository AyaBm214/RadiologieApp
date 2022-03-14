import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radiologiev2/app/data/Services/ServiceUser.dart';
import 'package:radiologiev2/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

// ignore: must_be_immutable
class LoginView extends GetView<LoginController> {
  LoginController loginController = Get.put(LoginController());
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Get.theme.primaryColor,
          elevation: 0.0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Get.offAndToNamed(Routes.HOME);
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          )),
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: WillPopScope(
          onWillPop: () {
            return Future<bool>.value(false);
          },
          child: Container(
            height: Get.height - AppBar().preferredSize.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/splash2.jpg"),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: GetPlatform.isAndroid
                      ? const EdgeInsets.all(20.0)
                      : const EdgeInsets.fromLTRB(20, 0, 20, 70),
                  child: Form(
                    key: loginFormKey,
                    child: Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      runAlignment: WrapAlignment.spaceAround,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 20, 20),
                                  child: TextFormField(
                                    controller: emailController,
                                    onChanged: (value) {
                                      ServiceUser.username =
                                          emailController.text;
                                      //print("onChanged: "+ServiceUser.username);
                                    },
                                    decoration: InputDecoration(
                                        errorStyle:
                                            const TextStyle(fontSize: 12.0),
                                        labelText: ("User name "),
                                        filled: true,
                                        fillColor: Colors.white,
                                        labelStyle: TextStyle(
                                          color: Get.theme.primaryColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          borderSide: BorderSide(
                                              color: Get.theme.primaryColor,
                                              width: 2.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            borderSide: BorderSide(
                                                color: Get.theme.primaryColor,
                                                width: 2.0)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            borderSide: BorderSide(
                                                color: Get.theme.primaryColor,
                                                width: 2.0))),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ("Invalid Email , Please try again");
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Obx(() => Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 20),
                                      child: TextFormField(
                                        controller: passwordController,
                                        onChanged: (value) {
                                          ServiceUser.password =
                                              passwordController.text;
                                          //print("onChanged: "+ServiceUser.password);
                                        },
                                        obscureText:
                                            loginController.viewPassWord.value,
                                        decoration: InputDecoration(
                                            errorStyle:
                                                const TextStyle(fontSize: 12.0),
                                            labelText: ("Password "),
                                            suffixIcon: IconButton(
                                                onPressed: () {
                                                  loginController
                                                      .showPassword();
                                                },
                                                icon: loginController
                                                        .viewPassWord.value
                                                    ? const Icon(
                                                        Icons.visibility_off)
                                                    : const Icon(
                                                        Icons.visibility)),
                                            filled: true,
                                            fillColor: Colors.white,
                                            labelStyle: TextStyle(
                                              color: Get.theme.primaryColor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              borderSide: BorderSide(
                                                  color: Get.theme.primaryColor,
                                                  width: 2.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                borderSide: BorderSide(
                                                    color:
                                                        Get.theme.primaryColor,
                                                    width: 2.0)),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                borderSide: BorderSide(
                                                    color:
                                                        Get.theme.primaryColor,
                                                    width: 2.0))),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return ("Password Invalid , please enter your password again");
                                          }
                                          return null;
                                        },
                                      ),
                                    )),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Container(
                                        width: 250,
                                        decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color.fromRGBO(
                                                  2, 61, 78, 0.7),
                                              blurRadius: 10.0,
                                              // has the effect of softening the shadow
                                              spreadRadius: 1.0,
                                              // has the effect of extending the shadow
                                              offset: Offset(
                                                5.0,
                                                5.0,
                                              ),
                                            ),
                                          ],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: FlatButton(
                                          onPressed: () {
                                            if (loginFormKey.currentState!
                                                .validate()) {}
                                          },
                                          child: Wrap(
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                ("Se Connecter"),
                                                style: TextStyle(
                                                  color: Get.theme.primaryColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Icon(
                                                Icons.login,
                                                color: Get.theme.primaryColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          16, 0, 16, 16),
                                      child: Container(
                                        width: 250,
                                        decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color.fromRGBO(
                                                  2, 61, 78, 0.7),
                                              blurRadius: 10.0,
                                              // has the effect of softening the shadow
                                              spreadRadius: 1.0,
                                              // has the effect of extending the shadow
                                              offset: Offset(
                                                5.0,
                                                5.0,
                                              ),
                                            ),
                                          ],
                                          color: const Color.fromRGBO(
                                              9, 153, 165, 1),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: FlatButton(
                                          onPressed: () {
                                            Get.toNamed(Routes.HOME);
                                          },
                                          child: Text("Change Clinique"),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        "© Developed by CliniSys",
                        style: const TextStyle(
                            color: Color.fromRGBO(21, 102, 116, 0.7),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
