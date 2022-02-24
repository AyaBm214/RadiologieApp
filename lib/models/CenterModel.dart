
// To parse this JSON data, do
//
//     final centerv = centervFromJson(jsonString);

import 'dart:convert';
Centerv centervFromJson(String str) => Centerv.fromJson(json.decode(str));

String centervToJson(Centerv data) => json.encode(data.toJson());

class Centerv {
  Centerv({
    required this.codeCentre,
    required this.designCentre,
    this.tableCptRendu,
    required this.nature,
    this.duree,
    this.natureActe,
    this.bloc,
    this.natureAdmission,
    required this.kt,
    required this.hopital,
    this.numrecept,
    this.autorisFacturationHonoraire,
    required this.indImage,
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

  factory Centerv.fromJson(Map<String, dynamic> json) => Centerv(
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

  Map<String, dynamic> toJson() => {
    "codeCentre": codeCentre,
    "designCentre": designCentre,
    "tableCptRendu": tableCptRendu,
    "nature": nature,
    "duree": duree,
    "natureActe": natureActe,
    "bloc": bloc,
    "natureAdmission": natureAdmission,
    "kt": kt,
    "hopital": hopital,
    "numrecept": numrecept,
    "autorisFacturationHonoraire": autorisFacturationHonoraire,
    "indImage": indImage,
    "imgCpt": imgCpt,
    "codMotif": codMotif,
  };
}

