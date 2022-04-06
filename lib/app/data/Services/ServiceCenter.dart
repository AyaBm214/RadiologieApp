import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:radiologiev2/app/data/Services/ServiceUser.dart';
import 'package:radiologiev2/app/data/models/CenterModel.dart';

class ServiceCenter {
  Future<List<Centerv>> fetchCenter() async {
    final response = await http.get(
        Uri.parse(ServiceUser.configuration.url + '/radiologie/api/centres'));
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
