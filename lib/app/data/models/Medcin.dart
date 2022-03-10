// To parse this JSON data, do
//
//     final medcin = medcinFromJson(jsonString);

import 'dart:convert';

List<Medecin> postFromJson(String str) =>
    List<Medecin>.from(json.decode(str).map((x) => Medecin.fromMap(x)));

class Medecin {
  Medecin({
    required this.codMed,
    this.nomMed,
    this.typMed,
    this.codSpe,
    this.adresse,
    this.cabinet,
    this.telDom,
    this.telBur,
    this.telAut,
    this.medLecture,
  });

  String? codMed;
  dynamic nomMed;
  dynamic typMed;
  dynamic codSpe;
  dynamic adresse;
  dynamic cabinet;
  dynamic telDom;
  dynamic telBur;
  dynamic telAut;
  dynamic medLecture;

  factory Medecin.fromMap(Map<String, dynamic> json) => Medecin(
        codMed: json["codMed"],
        nomMed: json["nomMed"],
        typMed: json["typMed"],
        codSpe: json["codSpe"],
        adresse: json["adresse"],
        cabinet: json["cabinet"],
        telDom: json["telDom"],
        telBur: json["telBur"],
        telAut: json["telAut"],
        medLecture: json["medLecture"],
      );
}
