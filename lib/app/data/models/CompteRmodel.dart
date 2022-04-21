// To parse this JSON data, do
//
//     final compteRendu = compteRenduFromJson(jsonString);

import 'dart:convert';

List<CompteRendu> postFromJson(String str) =>
    List<CompteRendu>.from(json.decode(str).map((x) => CompteRendu.fromMap(x)));

String compteRenduToJson(CompteRendu data) => json.encode(data.toJson());

class CompteRendu {
  CompteRendu({
    this.arriveCentre,
    this.arrivee,
    this.cdeMedPres,
    this.centre,
    this.codeCentre,
    this.codeSalle,
    this.cptEncours,
    required this.datNai,
    required this.date,
    this.dateExecution,
    required this.dateImp,
    this.designation,
    this.dicte,
    this.dicteEnCours,
    this.dureeAttente,
    this.dureeEnSalleEnMinute,
    this.dureeattenteArriv,
    this.dureeensalle,
    this.enSalle,
    required this.entreeSalle,
    this.etat,
    this.facture,
    this.hasHist,
    this.hasimgRadio,
    required this.heure,
    this.identifiant,
    this.imprimer,
    this.listCompteRenduAndPk,
    this.livre,
    this.medPres,
    this.medecinDictee,
    this.nDossier,
    this.ndossier,
    this.observ,
    this.patient,
    this.prepare,
    this.rensClin,
    this.resultat,
    this.salle,
    this.sex,
    this.sortieSalle,
    this.termine,
    this.typeExamen,
    this.v,
    this.validerMedDictee,
  });

  DateTime? arriveCentre;
  bool? arrivee;
  String? cdeMedPres;
  String? centre;
  String? codeCentre;
  int? codeSalle;
  bool? cptEncours;
  DateTime datNai;
  DateTime date;
  String? dateExecution;
  DateTime dateImp;
  String? designation;
  bool? dicte;
  bool? dicteEnCours;
  String? dureeAttente;
  int? dureeEnSalleEnMinute;
  String? dureeattenteArriv;
  String? dureeensalle;
  bool? enSalle;
  DateTime entreeSalle;
  String? etat;
  bool? facture;
  bool? hasHist;
  bool? hasimgRadio;
  DateTime heure;
  String? identifiant;
  bool? imprimer;
  ListCompteRenduAndPk? listCompteRenduAndPk;
  bool? livre;
  String? medPres;
  String? medecinDictee;
  String? nDossier;
  String? ndossier;
  String? observ;
  String? patient;
  bool? prepare;
  String? rensClin;
  bool? resultat;
  String? salle;
  bool? sex;
  DateTime? sortieSalle;
  bool? termine;
  String? typeExamen;
  bool? v;
  bool? validerMedDictee;

  factory CompteRendu.fromMap(Map<String, dynamic> json) => CompteRendu(
        arriveCentre: DateTime.parse(json["arriveCentre"]),
        arrivee: json["arrivee"],
        cdeMedPres: json["cdeMedPres"],
        centre: json["centre"],
        codeCentre: json["codeCentre"],
        codeSalle: json["codeSalle"],
        cptEncours: json["cptEncours"],
        datNai: DateTime.parse(json["datNai"]),
        date: DateTime.parse(json["date"]),
        dateExecution: json["dateExecution"],
        dateImp: DateTime.parse(json["dateImp"]),
        designation: json["designation"],
        dicte: json["dicte"],
        dicteEnCours: json["dicteEnCours"],
        dureeAttente: json["dureeAttente"],
        dureeEnSalleEnMinute: json["dureeEnSalleEnMinute"],
        dureeattenteArriv: json["dureeattenteArriv"],
        dureeensalle: json["dureeensalle"],
        enSalle: json["enSalle"],
        entreeSalle: DateTime.parse(json["entreeSalle"]),
        etat: json["etat"],
        facture: json["facture"],
        hasHist: json["hasHist"],
        hasimgRadio: json["hasimgRadio"],
        heure: DateTime.parse(json["heure"]),
        identifiant: json["identifiant"],
        imprimer: json["imprimer"],
        listCompteRenduAndPk:
            ListCompteRenduAndPk.fromJson(json["listCompteRenduAndPK"]),
        livre: json["livre"],
        medPres: json["medPres"],
        medecinDictee: json["medecinDictee"],
        nDossier: json["nDossier"],
        ndossier: json["ndossier"],
        observ: json["observ"],
        patient: json["patient"],
        prepare: json["prepare"],
        rensClin: json["rensClin"],
        resultat: json["resultat"],
        salle: json["salle"],
        sex: json["sex"],
        sortieSalle: DateTime.parse(json["sortieSalle"]),
        termine: json["termine"],
        typeExamen: json["typeExamen"],
        v: json["v"],
        validerMedDictee: json["validerMedDictee"],
      );

  Map<String, dynamic> toJson() => {
        "arriveCentre": arriveCentre?.toIso8601String(),
        "arrivee": arrivee,
        "cdeMedPres": cdeMedPres,
        "centre": centre,
        "codeCentre": codeCentre,
        "codeSalle": codeSalle,
        "cptEncours": cptEncours,
        "datNai": datNai.toIso8601String(),
        "date": date.toIso8601String(),
        "dateExecution": dateExecution,
        "dateImp": dateImp.toIso8601String(),
        "designation": designation,
        "dicte": dicte,
        "dicteEnCours": dicteEnCours,
        "dureeAttente": dureeAttente,
        "dureeEnSalleEnMinute": dureeEnSalleEnMinute,
        "dureeattenteArriv": dureeattenteArriv,
        "dureeensalle": dureeensalle,
        "enSalle": enSalle,
        "entreeSalle": entreeSalle.toIso8601String(),
        "etat": etat,
        "facture": facture,
        "hasHist": hasHist,
        "hasimgRadio": hasimgRadio,
        "heure": heure.toIso8601String(),
        "identifiant": identifiant,
        "imprimer": imprimer,
        "listCompteRenduAndPK": listCompteRenduAndPk?.toJson(),
        "livre": livre,
        "medPres": medPres,
        "medecinDictee": medecinDictee,
        "nDossier": nDossier,
        "ndossier": ndossier,
        "observ": observ,
        "patient": patient,
        "prepare": prepare,
        "rensClin": rensClin,
        "resultat": resultat,
        "salle": salle,
        "sex": sex,
        "sortieSalle": sortieSalle?.toIso8601String(),
        "termine": termine,
        "typeExamen": typeExamen,
        "v": v,
        "validerMedDictee": validerMedDictee,
      };
}

class ListCompteRenduAndPk {
  ListCompteRenduAndPk({
    required this.codeExam,
    required this.codeExamen,
  });

  String codeExam;
  String codeExamen;

  factory ListCompteRenduAndPk.fromJson(Map<String, dynamic> json) =>
      ListCompteRenduAndPk(
        codeExam: json["codeExam"],
        codeExamen: json["codeExamen"],
      );

  Map<String, dynamic> toJson() => {
        "codeExam": codeExam,
        "codeExamen": codeExamen,
      };
}
