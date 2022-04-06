import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:radiologiev2/app/data/models/SalleModel.dart';

import 'ServiceUser.dart';

class ServiceSalle {
  Future fetchSalle() async {
    final response = await http.get(
        Uri.parse(ServiceUser.configuration.url + '/radiologie/api/salles'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      print(parsed);
      return parsed.map<Salle>((json) => Salle.fromMap(json)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Salles');
    }
  }
}
