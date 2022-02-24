import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.userName,
    this.matricule,
    this.description,
    this.passWord,
    this.grp,
    this.oldGrp,
    this.codeMedecinInfirmier,
    this.actif,
    this.chStat,
    this.dernierDateCnx,
    this.dateModPwd,
    this.traceNotif,
    this.validCptRend,
    this.cptShowAllPatient,
    this.cptconsultActivityAll,
  });

  String? userName;
  String? matricule;
  String? description;
  String? passWord;
  String? grp;
  String? oldGrp;
  String? codeMedecinInfirmier;
  String? actif;
  String? chStat;
  int? dernierDateCnx;
  int? dateModPwd;
  String? traceNotif;
  bool? validCptRend;
  bool? cptShowAllPatient;
  bool? cptconsultActivityAll;

  factory User.fromJson(Map<String, dynamic> json) => User(
    userName: json["userName"],
    matricule: json["matricule"],
    description: json["description"],
    passWord: json["passWord"],
    grp: json["grp"],
    oldGrp: json["oldGrp"],
    codeMedecinInfirmier: json["codeMedecinInfirmier"],
    actif: json["actif"],
    chStat: json["chStat"],
    dernierDateCnx: json["dernierDateCnx"],
    dateModPwd: json["dateModPwd"],
    traceNotif: json["traceNotif"],
    validCptRend: json["validCptRend"],
    cptShowAllPatient: json["cptShowAllPatient"],
    cptconsultActivityAll: json["cptconsultActivityAll"],
  );

  Map<String, dynamic> toJson() => {
    "userName": userName,
    "matricule": matricule,
    "description": description,
    "passWord": passWord,
    "grp": grp,
    "oldGrp": oldGrp,
    "codeMedecinInfirmier": codeMedecinInfirmier,
    "actif": actif,
    "chStat": chStat,
    "dernierDateCnx": dernierDateCnx,
    "dateModPwd": dateModPwd,
    "traceNotif": traceNotif,
    "validCptRend": validCptRend,
    "cptShowAllPatient": cptShowAllPatient,
    "cptconsultActivityAll": cptconsultActivityAll,
  };
}
