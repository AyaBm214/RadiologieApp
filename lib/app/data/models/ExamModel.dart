// To parse this JSON data, do
//
//     final exam = examFromJson(jsonString);

import 'dart:convert';

List<Exam> postFromJson(String str) =>
    List<Exam>.from(json.decode(str).map((x) => Exam.fromMap(x)));

class Exam {
  Exam({
    this.codexam,
    this.desexam,
    this.prixrad,
    this.prixhon,
    this.coeff,
    this.famexam,
    this.prixpharm,
    this.total,
    this.actif,
    this.nature,
    this.idType,
    this.mnthoExamCnam,
  });

  String? codexam;
  String? desexam;
  String? prixrad;
  String? prixhon;
  String? coeff;
  String? famexam;
  String? prixpharm;
  double? total;
  bool? actif;
  String? nature;
  dynamic idType;
  String? mnthoExamCnam;

  factory Exam.fromMap(Map<String, dynamic> json) => Exam(
        codexam: json["codexam"],
        desexam: json["desexam"],
        prixrad: json["prixrad"].toString(),
        prixhon: json["prixhon"].toString(),
        coeff: json["coeff"].toString(),
        famexam: json["famexam"],
        prixpharm: json["prixpharm"].toString(),
        total: json["total"].toDouble(),
        actif: json["actif"],
        nature: json["nature"].toString(),
        idType: json["idType"],
        mnthoExamCnam: json["mnthoExamCNAM"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "codexam": codexam,
        "desexam": desexam,
        "prixrad": prixrad,
        "prixhon": prixhon,
        "coeff": coeff,
        "famexam": famexam,
        "prixpharm": prixpharm,
        "total": total,
        "actif": actif,
        "nature": nature,
        "idType": idType,
        "mnthoExamCNAM": mnthoExamCnam,
      };
}
