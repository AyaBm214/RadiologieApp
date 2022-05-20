// To parse this JSON data, do
//
//     final compteRenduExploration = compteRenduExplorationFromJson(jsonString);

import 'dart:convert';

CompteRenduExploration compteRenduExplorationFromJson(String str) =>
    CompteRenduExploration.fromMap(json.decode(str));

String compteRenduExplorationToJson(CompteRenduExploration data) =>
    json.encode(data.toJson());

class CompteRenduExploration {
  CompteRenduExploration({
    required this.listCompteRenduExploAndPk,
    required this.v,
    required this.nDossier,
    required this.patient,
    required this.datNai,
    required this.sex,
    required this.designation,
    required this.observ,
    required this.date,
    required this.heure,
    this.medecinDictee,
    required this.cdeMedPres,
    required this.codeCentre,
    required this.centre,
    required this.codeSalle,
    required this.salle,
    required this.identifiant,
    required this.termine,
    this.entreeSalle,
    this.sortieSalle,
    required this.dureeAttente,
    this.dureeensalle,
    this.dureeattenteArriv,
    this.dureeEnSalleEnMinute,
    required this.validerMedDictee,
    required this.typeExamen,
    required this.resultat,
    required this.facture,
    this.dateImp,
    required this.imprimer,
    required this.dateExecution,
    required this.livre,
    required this.dicte,
    required this.dicteEnCours,
    this.arriveCentre,
    required this.rensClin,
    required this.hasHist,
    required this.hasimgRadio,
    required this.arrivee,
    required this.prepare,
    required this.enSalle,
    required this.cptEncours,
    required this.etat,
    required this.ndossier,
    required this.medPres,
  });

  ListCompteRenduExploAndPk listCompteRenduExploAndPk;
  bool v;
  String nDossier;
  String patient;
  int datNai;
  bool sex;
  String designation;
  String observ;
  int date;
  int heure;
  dynamic medecinDictee;
  String cdeMedPres;
  String codeCentre;
  String centre;
  int codeSalle;
  String salle;
  String identifiant;
  bool termine;
  dynamic entreeSalle;
  dynamic sortieSalle;
  String dureeAttente;
  dynamic dureeensalle;
  dynamic dureeattenteArriv;
  dynamic dureeEnSalleEnMinute;
  bool validerMedDictee;
  String typeExamen;
  bool resultat;
  bool facture;
  dynamic dateImp;
  bool imprimer;
  String dateExecution;
  bool livre;
  bool dicte;
  bool dicteEnCours;
  dynamic arriveCentre;
  String rensClin;
  bool hasHist;
  bool hasimgRadio;
  bool arrivee;
  bool prepare;
  bool enSalle;
  bool cptEncours;
  String etat;
  String ndossier;
  String medPres;

  factory CompteRenduExploration.fromMap(Map<String, dynamic> json) =>
      CompteRenduExploration(
        listCompteRenduExploAndPk: ListCompteRenduExploAndPk.fromJson(
            json["listCompteRenduExploAndPK"]),
        v: json["v"],
        nDossier: json["nDossier"],
        patient: json["patient"],
        datNai: json["datNai"],
        sex: json["sex"],
        designation: json["designation"],
        observ: json["observ"],
        date: json["date"],
        heure: json["heure"],
        medecinDictee: json["medecinDictee"],
        cdeMedPres: json["cdeMedPres"],
        codeCentre: json["codeCentre"],
        centre: json["centre"],
        codeSalle: json["codeSalle"],
        salle: json["salle"],
        identifiant: json["identifiant"],
        termine: json["termine"],
        entreeSalle: json["entreeSalle"],
        sortieSalle: json["sortieSalle"],
        dureeAttente: json["dureeAttente"],
        dureeensalle: json["dureeensalle"],
        dureeattenteArriv: json["dureeattenteArriv"],
        dureeEnSalleEnMinute: json["dureeEnSalleEnMinute"],
        validerMedDictee: json["validerMedDictee"],
        typeExamen: json["typeExamen"],
        resultat: json["resultat"],
        facture: json["facture"],
        dateImp: json["dateImp"],
        imprimer: json["imprimer"],
        dateExecution: json["dateExecution"],
        livre: json["livre"],
        dicte: json["dicte"],
        dicteEnCours: json["dicteEnCours"],
        arriveCentre: json["arriveCentre"],
        rensClin: json["rensClin"],
        hasHist: json["hasHist"],
        hasimgRadio: json["hasimgRadio"],
        arrivee: json["arrivee"],
        prepare: json["prepare"],
        enSalle: json["enSalle"],
        cptEncours: json["cptEncours"],
        etat: json["etat"],
        ndossier: json["ndossier"],
        medPres: json["medPres"],
      );

  Map<String, dynamic> toJson() => {
        "listCompteRenduExploAndPK": listCompteRenduExploAndPk.toJson(),
        "v": v,
        "nDossier": nDossier,
        "patient": patient,
        "datNai": datNai,
        "sex": sex,
        "designation": designation,
        "observ": observ,
        "date": date,
        "heure": heure,
        "medecinDictee": medecinDictee,
        "cdeMedPres": cdeMedPres,
        "codeCentre": codeCentre,
        "centre": centre,
        "codeSalle": codeSalle,
        "salle": salle,
        "identifiant": identifiant,
        "termine": termine,
        "entreeSalle": entreeSalle,
        "sortieSalle": sortieSalle,
        "dureeAttente": dureeAttente,
        "dureeensalle": dureeensalle,
        "dureeattenteArriv": dureeattenteArriv,
        "dureeEnSalleEnMinute": dureeEnSalleEnMinute,
        "validerMedDictee": validerMedDictee,
        "typeExamen": typeExamen,
        "resultat": resultat,
        "facture": facture,
        "dateImp": dateImp,
        "imprimer": imprimer,
        "dateExecution": dateExecution,
        "livre": livre,
        "dicte": dicte,
        "dicteEnCours": dicteEnCours,
        "arriveCentre": arriveCentre,
        "rensClin": rensClin,
        "hasHist": hasHist,
        "hasimgRadio": hasimgRadio,
        "arrivee": arrivee,
        "prepare": prepare,
        "enSalle": enSalle,
        "cptEncours": cptEncours,
        "etat": etat,
        "ndossier": ndossier,
        "medPres": medPres,
      };
}

class ListCompteRenduExploAndPk {
  ListCompteRenduExploAndPk({
    required this.codeExam,
    required this.codeExamen,
  });

  String codeExam;
  String codeExamen;

  factory ListCompteRenduExploAndPk.fromJson(Map<String, dynamic> json) =>
      ListCompteRenduExploAndPk(
        codeExam: json["codeExam"],
        codeExamen: json["codeExamen"],
      );

  Map<String, dynamic> toJson() => {
        "codeExam": codeExam,
        "codeExamen": codeExamen,
      };
}
