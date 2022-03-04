import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Medcin.dart';



class ServiceMedcin {
  Future<List<Medcin>> fetchMedcin() async {
    final response = await http
        .get(Uri.parse('http://192.168.1.242:9015/radiologie/api/medecins'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      print(parsed);
      return parsed.map<Medcin>((json) => Medcin.fromMap(json)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Medecins');
    }
  }
}