import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:radiologiev2/app/data/models/OrganismeModel.dart';

class ServiceOrganisme {
  fetchOrganisme() async {
    final response = await http
        .get(Uri.parse('http://192.168.1.242:9015/radiologie/api/societes'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      print(parsed);
      return parsed.map<Organisme>((json) => Organisme.fromMap(json)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Organismes');
    }
  }
}
