import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ServiceUser extends GetConnect {
  static String? username="";
  static String? password="";
  static String? token = "";
  static var client = http.Client();

  Future<String?> login() async{
    print(username!+"    "+password!);
    var response = await client.get(
        Uri.parse("http://192.168.1.242:9015/radiologie/api/accesscontrols/findByUserNameAndPassWord?user="+username!+"&pass="+password!+""),
        headers: <String,String>{
          "Accept": "*/*"
        },
    ).timeout(const Duration(seconds: 20));
print(response);
    print("code"+response.statusCode.toString());
    print("omg"+response.body);
    if(response.statusCode==200 && response.body.isNotEmpty){
      token="200";
    }
  }
}