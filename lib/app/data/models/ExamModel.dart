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
  int? prixrad;
  int? prixhon;
  int? coeff;
  String? famexam;
  int? prixpharm;
  double? total;
  bool? actif;
  int? nature;
  dynamic idType;
  int? mnthoExamCnam;

  factory Exam.fromMap(Map<String, dynamic> json) => Exam(
        codexam: json["codexam"],
        desexam: json["desexam"],
        prixrad: json["prixrad"],
        prixhon: json["prixhon"],
        coeff: json["coeff"],
        famexam: json["famexam"],
        prixpharm: json["prixpharm"],
        total: json["total"].toDouble(),
        actif: json["actif"],
        nature: json["nature"],
        idType: json["idType"],
        mnthoExamCnam: json["mnthoExamCNAM"],
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
