// To parse this JSON data, do
//
//     final organisme = organismeFromJson(jsonString);

import 'dart:convert';

List<Organisme> OrganismeFromJson(String str) =>
    List<Organisme>.from(json.decode(str).map((x) => Organisme.fromJson(x)));

String OrganismeToJson(List<Organisme> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Organisme {
  Organisme({
    this.numSoc,
    this.desSoc,
    this.adrSoc,
    this.telSoc,
    this.faxSoc,
    this.exon,
    this.numExo,
    this.datDebExo,
    this.datFinExo,
    this.datOuv,
    this.tauRet,
    this.etaSoc,
    this.solCou,
    this.credit,
    this.debit,
    this.timbre,
    this.numCpt,
    this.delreg,
    this.plafond,
    this.typeCent,
    this.codeCent,
    this.cleCent,
    this.cnam,
    this.timbrePec,
    this.extraPec,
    this.tvapec,
    this.convPatient,
    this.actif,
    this.hopatpec,
    this.userModif,
    this.priseEnCharge,
    this.valeurPriseEnCharge,
    this.remise,
    this.valeurRemise,
    this.valeurB,
    this.valeurApb,
    this.rib,
    this.dateCreation,
    this.userCreation,
    this.franchise,
    this.validitePec,
    this.retFraischange,
    this.venduFactoring,
    this.numCptAvance,
    this.numCptFacturing,
    this.seuil,
    this.codeSousFam,
    this.sousSociete,
    this.nomTableAdherant,
    this.tauxPlafond,
    this.activite,
    this.matFiscal,
    this.nlettr,
  });

  dynamic numSoc;
  String? desSoc;
  dynamic adrSoc;
  dynamic telSoc;
  dynamic faxSoc;
  dynamic exon;
  dynamic numExo;
  dynamic datDebExo;
  dynamic datFinExo;
  dynamic datOuv;
  dynamic tauRet;
  dynamic etaSoc;
  dynamic solCou;
  dynamic credit;
  dynamic debit;
  dynamic timbre;
  dynamic numCpt;
  dynamic delreg;
  dynamic plafond;
  dynamic typeCent;
  dynamic codeCent;
  dynamic cleCent;
  dynamic cnam;
  dynamic timbrePec;
  dynamic extraPec;
  dynamic tvapec;
  dynamic convPatient;
  dynamic actif;
  dynamic hopatpec;
  dynamic userModif;
  dynamic priseEnCharge;
  dynamic valeurPriseEnCharge;
  dynamic remise;
  dynamic valeurRemise;
  dynamic valeurB;
  dynamic valeurApb;
  dynamic rib;
  dynamic dateCreation;
  dynamic userCreation;
  dynamic franchise;
  dynamic validitePec;
  dynamic retFraischange;
  dynamic venduFactoring;
  dynamic numCptAvance;
  dynamic numCptFacturing;
  dynamic seuil;
  dynamic codeSousFam;
  dynamic sousSociete;
  dynamic nomTableAdherant;
  dynamic tauxPlafond;
  dynamic activite;
  dynamic matFiscal;
  dynamic nlettr;

  factory Organisme.fromJson(Map<String, dynamic> json) => Organisme(
        numSoc: json["numSoc"],
        desSoc: json["desSoc"],
        adrSoc: json["adrSoc"],
        telSoc: json["telSoc"],
        faxSoc: json["faxSoc"],
        exon: json["exon"],
        numExo: json["numExo"],
        datDebExo: json["datDebExo"],
        datFinExo: json["datFinExo"],
        datOuv: json["datOuv"],
        tauRet: json["tauRet"],
        etaSoc: json["etaSoc"],
        solCou: json["solCou"],
        credit: json["credit"],
        debit: json["debit"],
        timbre: json["timbre"],
        numCpt: json["numCpt"],
        delreg: json["delreg"],
        plafond: json["plafond"],
        typeCent: json["typeCent"],
        codeCent: json["codeCent"],
        cleCent: json["cleCent"],
        cnam: json["cnam"],
        timbrePec: json["timbrePEC"],
        extraPec: json["extraPEC"],
        tvapec: json["tvapec"],
        convPatient: json["convPatient"],
        actif: json["actif"],
        hopatpec: json["hopatpec"],
        userModif: json["userModif"],
        priseEnCharge: json["priseEnCharge"],
        valeurPriseEnCharge: json["valeurPriseEnCharge"],
        remise: json["remise"],
        valeurRemise: json["valeurRemise"],
        valeurB: json["valeurB"],
        valeurApb: json["valeurAPB"],
        rib: json["rib"],
        dateCreation: json["dateCreation"],
        userCreation: json["userCreation"],
        franchise: json["franchise"],
        validitePec: json["validitePEC"],
        retFraischange: json["retFraischange"],
        venduFactoring: json["venduFactoring"],
        numCptAvance: json["numCptAvance"],
        numCptFacturing: json["numCptFacturing"],
        seuil: json["seuil"],
        codeSousFam: json["codeSousFam"],
        sousSociete: json["sousSociete"],
        nomTableAdherant: json["nomTableAdherant"],
        tauxPlafond: json["tauxPlafond"],
        activite: json["activite"],
        matFiscal: json["matFiscal"],
        nlettr: json["nlettr"],
      );

  Map<String, dynamic> toJson() => {
        "numSoc": numSoc,
        "desSoc": desSoc,
        "adrSoc": adrSoc,
        "telSoc": telSoc,
        "faxSoc": faxSoc,
        "exon": exon,
        "numExo": numExo,
        "datDebExo": datDebExo,
        "datFinExo": datFinExo,
        "datOuv": datOuv,
        "tauRet": tauRet,
        "etaSoc": etaSoc,
        "solCou": solCou,
        "credit": credit,
        "debit": debit,
        "timbre": timbre,
        "numCpt": numCpt,
        "delreg": delreg,
        "plafond": plafond,
        "typeCent": typeCent,
        "codeCent": codeCent,
        "cleCent": cleCent,
        "cnam": cnam,
        "timbrePEC": timbrePec,
        "extraPEC": extraPec,
        "tvapec": tvapec,
        "convPatient": convPatient,
        "actif": actif,
        "hopatpec": hopatpec,
        "userModif": userModif,
        "priseEnCharge": priseEnCharge,
        "valeurPriseEnCharge": valeurPriseEnCharge,
        "remise": remise,
        "valeurRemise": valeurRemise,
        "valeurB": valeurB,
        "valeurAPB": valeurApb,
        "rib": rib,
        "dateCreation": dateCreation,
        "userCreation": userCreation,
        "franchise": franchise,
        "validitePEC": validitePec,
        "retFraischange": retFraischange,
        "venduFactoring": venduFactoring,
        "numCptAvance": numCptAvance,
        "numCptFacturing": numCptFacturing,
        "seuil": seuil,
        "codeSousFam": codeSousFam,
        "sousSociete": sousSociete,
        "nomTableAdherant": nomTableAdherant,
        "tauxPlafond": tauxPlafond,
        "activite": activite,
        "matFiscal": matFiscal,
        "nlettr": nlettr,
      };
}
