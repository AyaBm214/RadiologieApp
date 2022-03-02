
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:radiologiev2/app/modules/Acceuil/views/CenterModel.dart';
class ServiceCenter {
  Future<List<Centerv>> fetchCenter() async {
    final response = await http
        .get(Uri.parse('http://192.168.1.242:9015/radiologie/api/centres'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Centerv>((json) => Centerv.fromMap(json)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Centers');
    }
  }
}
