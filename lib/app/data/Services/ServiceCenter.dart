import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:radiologiev2/app/data/Services/ServiceUser.dart';
import 'package:radiologiev2/app/data/models/CenterModel.dart';

class ServiceCenter {
  static List<Centerv> listCenter = List.empty(growable: true);
  Future<List<Centerv>> fetchCenter() async {
    final response = await http.get(Uri.parse(ServiceUser.configuration.url! +
        '/radiologie/api/centres/getAllCentresRDV'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<Centerv> list = centerFromJson(utf8.decode(response.bodyBytes));
      listCenter = list;
      log(list.toString());
      return list;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Centers');
    }
  }
}
