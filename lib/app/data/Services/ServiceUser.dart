import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:radiologiev2/app/data/models/authentification.dart';
import 'package:radiologiev2/app/data/models/user.dart';

class ServiceUser extends GetConnect {
  static String? username;
  static String? password;
  static String? token = "";
  static User? user;
  static var client = http.Client();
  static Authentification configuration = Authentification();
  static List<String> blocs = ["radio", "Exploration", "cathé"];

  Future<String?> login() async {
    print(username! + "    " + password!);
    print(configuration.url! +
        "/radiologie/api/accesscontrols/findByUserNameAndPassWord?user=" +
        username! +
        "&pass=" +
        password! +
        "");
    var response = await client.get(
      Uri.parse(configuration.url! +
          "/radiologie/api/accesscontrols/findByUserNameAndPassWord?user=" +
          username! +
          "&pass=" +
          password! +
          ""),
      headers: <String, String>{"Accept": "*/*"},
    ).timeout(const Duration(seconds: 20));
    print(response.toString());
    print("code" + response.statusCode.toString());
    print("omg" + response.body);
    if (response.statusCode == 200 && response.body.isNotEmpty) {
      user = userFromJson(response.body);
      log(user.toString());
      log("zzzzzzzzzzzzzzzzzzzzzzzzzzz");
      log(user!.grp!);
      log(configuration.codeCli!);
      token = "200";
      if (configuration.codeCli == "PAS01" ||
          configuration.codeCli == "MV01" ||
          configuration.codeCli == "VR01") {
        if (!user!.grp!.toLowerCase().contains("radio")) {
          blocs.remove("radio");
        }
        if (!user!.grp!.toLowerCase().contains("exploration")) {
          blocs.remove("Exploration");
        }
        if (!user!.grp!.toLowerCase().contains("bloc") &&
            !user!.grp!.toLowerCase().contains("cathé")) {
          blocs.remove("bloc");
        }
      } else {
        blocs.remove("exploration");
        blocs.remove("bloc");
      }
    }
  }
}
