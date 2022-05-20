import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:radiologiev2/app/data/models/Exploration.dart';

import 'ServiceUser.dart';

class ServiceCompteRenduExploration {
  static Future fetchCompteRenduExplo() async {
    print(ServiceUser.configuration.url! +
        '/radiologie/api/listcompterenduexploands/filterCrExploByDateAndCentreAndSalleAndEtatAndCodeMedPres?dateDebut=' +
        DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day - 1)
            .millisecondsSinceEpoch
            .toString() +
        '&dateFin=' +
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .millisecondsSinceEpoch
            .toString());
    final response = await http.get(Uri.parse(ServiceUser.configuration.url! +
        '/radiologie/api/listcompterenduexploands/filterCrExploByDateAndCentreAndSalleAndEtatAndCodeMedPres?dateDebut=' +
        DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day - 1)
            .millisecondsSinceEpoch
            .toString() +
        '&dateFin=' +
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .millisecondsSinceEpoch
            .toString()));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<CompteRenduExploration>(
              (json) => CompteRenduExploration.fromMap(json))
          .toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Comptes Explo ');
    }
  }
}
