import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:radiologiev2/app/data/models/SalleModel.dart';

import 'ServiceUser.dart';

class ServiceSalle {
  static List<Salle> allSalles = List.empty(growable: true);
  static List<Salle> sallesByCentre = List.empty(growable: true);
  Future fetchSalle() async {
    final response = await http.get(
        Uri.parse(ServiceUser.configuration.url! + '/radiologie/api/salles'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<Salle> list = sallesFromJson(utf8.decode(response.bodyBytes));
      allSalles = list;
      return list;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Salles');
    }
  }

  Future fetchSalleByCentre(String codeCentre) async {
    log(ServiceUser.configuration.url! +
        '/radiologie/api/salles/findSalleByCodeCentre?codeCentre=' +
        codeCentre);
    final response = await http.get(Uri.parse(ServiceUser.configuration.url! +
        '/radiologie/api/salles/findSalleByCodeCentre?codeCentre=' +
        codeCentre));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<Salle> list = sallesFromJson(utf8.decode(response.bodyBytes));
      sallesByCentre = list;
      return list;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Salles');
    }
  }
}
