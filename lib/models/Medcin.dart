// To parse this JSON data, do
//
//     final medcin = medcinFromJson(jsonString);

import 'dart:convert';
List<Medcin> postFromJson(String str) =>
    List<Medcin>.from(json.decode(str).map((x) => Medcin.fromMap(x)));

class Medcin {
  Medcin({
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

  factory Medcin.fromMap(Map<String, dynamic> json) => Medcin(
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
