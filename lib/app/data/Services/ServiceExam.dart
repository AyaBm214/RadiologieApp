import 'dart:convert';

import 'package:http/http.dart' as http;

import 'ServiceUser.dart';

class ServiceExam {
  Future fetchExam() async {
    print("rrrrrrrrrrrrrrrrrrr");
    final response = await http.get(
        Uri.parse(ServiceUser.configuration.url! + '/radiologie/api/examrads'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      print(parsed);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Exams');
    }
  }
}
