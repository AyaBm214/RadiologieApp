// To parse this JSON data, do
//
//     final centerv = centervFromJson(jsonString);

import 'dart:convert';

List<Centerv> postFromJson(String str) =>
    List<Centerv>.from(json.decode(str).map((x) => Centerv.fromMap(x)));

class Centerv {
  Centerv({
    this.codeCentre,
    this.designCentre,
    this.tableCptRendu,
    this.nature,
    this.duree,
    this.natureActe,
    this.bloc,
    this.natureAdmission,
    this.kt,
    this.hopital,
    this.numrecept,
    this.autorisFacturationHonoraire,
    this.indImage,
    this.imgCpt,
    this.codMotif,
  });

  String? codeCentre;
  String? designCentre;
  dynamic tableCptRendu;
  int? nature;
  dynamic duree;
  int? natureActe;
  bool? bloc;
  dynamic natureAdmission;
  bool? kt;
  bool? hopital;
  dynamic numrecept;
  dynamic autorisFacturationHonoraire;
  int? indImage;
  dynamic imgCpt;
  dynamic codMotif;

  factory Centerv.fromMap(Map<String, dynamic> json) => Centerv(
        codeCentre: json["codeCentre"],
        designCentre: json["designCentre"],
        tableCptRendu: json["tableCptRendu"],
        nature: json["nature"],
        duree: json["duree"],
        natureActe: json["natureActe"],
        bloc: json["bloc"],
        natureAdmission: json["natureAdmission"],
        kt: json["kt"],
        hopital: json["hopital"],
        numrecept: json["numrecept"],
        autorisFacturationHonoraire: json["autorisFacturationHonoraire"],
        indImage: json["indImage"],
        imgCpt: json["imgCpt"],
        codMotif: json["codMotif"],
      );
}
