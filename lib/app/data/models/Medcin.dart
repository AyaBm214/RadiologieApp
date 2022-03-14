// To parse this JSON data, do
//
//     final medcin = medcinFromJson(jsonString);

import 'dart:convert';

List<Medecin> MedecinFromJson(String str) =>
    List<Medecin>.from(json.decode(str).map((x) => Medecin.fromJson(x)));

String OrganismeToJson(List<Medecin> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
  String? typMed;
  dynamic codSpe;
  dynamic adresse;
  dynamic cabinet;
  dynamic telDom;
  dynamic telBur;
  dynamic telAut;
  dynamic medLecture;

  factory Medecin.fromJson(Map<String, dynamic> json) => Medecin(
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
  Map<String, dynamic> toJson() => {
        "codMed": codMed,
        "nomMed": nomMed,
        "typMed": typMed,
        "codSpe": codSpe,
        "adresse": adresse,
        "cabinet": cabinet,
        "telDom": telDom,
        "telBur": telBur,
        "telAut": telAut,
        "medLecture": medLecture,
      };
}
