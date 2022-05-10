// To parse this JSON data, do
//
//     final compteRendu = compteRenduFromJson(jsonString);

import 'dart:convert';

List<CompteRendu> postFromJson(String str) =>
    List<CompteRendu>.from(json.decode(str).map((x) => CompteRendu.fromMap(x)));

String compteRenduToJson(CompteRendu data) => json.encode(data.toJson());

class CompteRendu {
  CompteRendu({
    required this.listCompteRenduAndPk,
    this.v,
    this.nDossier,
    this.patient,
    this.datNai,
    this.sex,
    this.designation,
    this.observ,
    this.date,
    this.heure,
    this.medecinDictee,
    this.cdeMedPres,
    this.codeCentre,
    this.centre,
    this.codeSalle,
    this.salle,
    this.identifiant,
    this.termine,
    this.entreeSalle,
    this.sortieSalle,
    this.dureeAttente,
    this.dureeensalle,
    this.dureeattenteArriv,
    this.dureeEnSalleEnMinute,
    this.validerMedDictee,
    this.typeExamen,
    this.resultat,
    this.facture,
    this.dateImp,
    this.imprimer,
    this.dateExecution,
    this.livre,
    this.dicte,
    this.dicteEnCours,
    this.arriveCentre,
    this.rensClin,
    this.hasHist,
    this.hasimgRadio,
    this.arrivee,
    this.prepare,
    this.enSalle,
    this.cptEncours,
    this.etat,
    this.ndossier,
    this.medPres,
  });

  ListCompteRenduAndPk listCompteRenduAndPk;
  bool? v;
  dynamic nDossier;
  String? patient;
  dynamic datNai;
  bool? sex;
  dynamic designation;
  dynamic observ;
  dynamic date;
  dynamic heure;
  dynamic medecinDictee;
  dynamic cdeMedPres;
  dynamic codeCentre;
  dynamic centre;
  dynamic codeSalle;
  dynamic salle;
  dynamic identifiant;
  bool? termine;
  dynamic entreeSalle;
  dynamic sortieSalle;
  dynamic dureeAttente;
  dynamic dureeensalle;
  dynamic dureeattenteArriv;
  dynamic dureeEnSalleEnMinute;
  bool? validerMedDictee;
  dynamic typeExamen;
  bool? resultat;
  bool? facture;
  dynamic dateImp;
  bool? imprimer;
  dynamic dateExecution;
  bool? livre;
  bool? dicte;
  bool? dicteEnCours;
  dynamic arriveCentre;
  dynamic rensClin;
  bool? hasHist;
  bool? hasimgRadio;
  bool? arrivee;
  bool? prepare;
  bool? enSalle;
  bool? cptEncours;
  dynamic etat;
  dynamic ndossier;
  dynamic medPres;

  factory CompteRendu.fromMap(Map<String, dynamic> json) => CompteRendu(
        listCompteRenduAndPk:
            ListCompteRenduAndPk.fromJson(json["listCompteRenduAndPK"]),
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
        "listCompteRenduAndPK": listCompteRenduAndPk.toJson(),
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
