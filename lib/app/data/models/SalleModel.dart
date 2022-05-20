// To parse this JSON data, do
//
//     final salle = salleFromJson(jsonString);

import 'dart:convert';

List<Salle> sallesFromJson(String str) =>
    List<Salle>.from(json.decode(str).map((x) => Salle.fromMap(x)));

class Salle {
  Salle({
    this.codeSalle,
    this.designation,
    this.codeCentre,
    this.codSalleEndo,
    this.modalite,
    this.num,
    this.descModalite,
    this.stationAet,
  });

  int? codeSalle;
  String? designation;
  String? codeCentre;
  dynamic codSalleEndo;
  String? modalite;
  int? num;
  String? descModalite;
  String? stationAet;

  factory Salle.fromMap(Map<String, dynamic> json) => Salle(
        codeSalle: json["codeSalle"],
        designation: json["designation"],
        codeCentre: json["codeCentre"],
        codSalleEndo: json["codSalleEndo"],
        modalite: json["modalite"],
        num: json["num"],
        descModalite: json["descModalite"],
        stationAet: json["stationAet"],
      );

  Map<String, dynamic> toJson() => {
        "codeSalle": codeSalle,
        "designation": designation,
        "codeCentre": codeCentre,
        "codSalleEndo": codSalleEndo,
        "modalite": modalite,
        "num": num,
        "descModalite": descModalite,
        "stationAet": stationAet,
      };

  @override
  String toString() {
    return 'Salle{codeSalle: $codeSalle, designation: $designation, codeCentre: $codeCentre, codSalleEndo: $codSalleEndo, modalite: $modalite, num: $num, descModalite: $descModalite, stationAet: $stationAet}';
  }
}
