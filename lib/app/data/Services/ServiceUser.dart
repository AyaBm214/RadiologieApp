import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:radiologiev2/app/data/models/authentification.dart';

class ServiceUser extends GetConnect {
  static String? username;
  static String? password;
  static String? token = "";
  static var client = http.Client();
  static Authentification configuration = Authentification();

  Future<String?> login() async {
    print("aaaaaaaaaaaaaaaaaaaaaa");
    print(username! + "    " + password!);
    print(configuration.url +
        "/radiologie/api/accesscontrols/findByUserNameAndPassWord?user=" +
        username! +
        "&pass=" +
        password! +
        "");
    print("bbbbbbbbbbbbbbbbbbbb");
    var response = await client.get(
      Uri.parse(configuration.url +
          "/radiologie/api/accesscontrols/findByUserNameAndPassWord?user=" +
          username! +
          "&pass=" +
          password! +
          ""),
      headers: <String, String>{"Accept": "*/*"},
    ).timeout(const Duration(seconds: 20));
    print(response);
    print("code" + response.statusCode.toString());
    print("omg" + response.body);
    if (response.statusCode == 200 && response.body.isNotEmpty) {
      token = "200";
    }
  }
}
