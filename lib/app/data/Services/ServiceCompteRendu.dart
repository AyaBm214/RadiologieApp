import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:radiologiev2/app/data/models/CompteRmodel.dart';

import 'ServiceUser.dart';

class ServiceCompteRendu {
  static Future fetchCompteRendu() async {
    final response = await http.get(Uri.parse(ServiceUser.configuration.url +
        '/radiologie/api/listcompterenduands/filterBySalleAndCentre'));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      print(parsed);
      return parsed
          .map<CompteRendu>((json) => CompteRendu.fromMap(json))
          .toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Comptes');
    }
  }
}
