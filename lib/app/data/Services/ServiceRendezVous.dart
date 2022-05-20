import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:radiologiev2/app/data/models/RendezVousModel.dart';

import 'ServiceUser.dart';

class ServiceRendezVous {
  Future RendezVous(int date) async {
    log(ServiceUser.configuration.url! +
        '/radiologie/api/listrdvands/filterByDateAndCentreAndSalle?dateDebut=' +
        date.toString() +
        '&dateFin=' +
        date.toString());
    final response = await http.get(Uri.parse(ServiceUser.configuration.url! +
        '/radiologie/api/listrdvands/filterByDateAndCentreAndSalle?dateDebut=' +
        date.toString() +
        '&dateFin=' +
        date.toString()));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return rendezVousFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load RendezVous');
    }
  }
}
