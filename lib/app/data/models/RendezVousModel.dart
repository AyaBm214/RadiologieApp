// To parse this JSON data, do
//
//     final rendezVous = rendezVousFromJson(jsonString);

import 'dart:convert';

import 'package:intl_phone_field/phone_number.dart';

RendezVous rendezVousFromJson(String str) =>
    RendezVous.fromJson(json.decode(str));

String rendezVousToJson(RendezVous data) => json.encode(data.toJson());

class RendezVous {
  RendezVous({
    this.codeCentre,
    this.Centre,
    this.Salle,
    this.medecinM,
    this.medecinP,
    this.objet,
    this.email,
    this.organisme,
    this.telperson,
    this.tel,
    this.codeMed,
    this.codeSalle,
    this.designation,
    this.Exam,
    this.id,
    this.listRdvAndPk,
    this.nomCli,
    this.prenom,
    this.Daterdv,
    this.Heurerdv,
  });

  String? codeCentre;
  String? Centre;
  String? Salle;
  String? medecinM;
  String? medecinP;
  String? objet;
  String? email;
  String? organisme;
  PhoneNumber? telperson;
  PhoneNumber? tel;
  String? codeMed;
  int? codeSalle;
  String? designation;
  String? Exam;
  String? id;
  ListRdvAndPk? listRdvAndPk;
  String? nomCli;
  String? prenom;
  DateTime? Daterdv;
  DateTime? Heurerdv;

  factory RendezVous.fromJson(Map<String, dynamic> json) => RendezVous(
        codeCentre: json["codeCentre"],
        Centre: json["designCentre"],
        Salle: json["dessalle"],
        medecinM: json["MedecinM"],
        medecinP: json["MedecinP"],
        objet: json["objet"],
        email: json["email"],
        organisme: json["Organisme"],
        telperson: json["telperson"],
        tel: json["Tel"],
        codeMed: json["codeMed"],
        codeSalle: json["codeSalle"],
        designation: json["designation"],
        Exam: json["designationExam"],
        id: json["id"],
        listRdvAndPk: ListRdvAndPk.fromJson(json["listRdvAndPK"]),
        nomCli: json["nomCli"],
        prenom: json["prenom"],
        Daterdv: json["Daterdv"],
        Heurerdv: json["Heurerdv"],
      );

  Map<String, dynamic> toJson() => {
        "codeCentre": codeCentre,
        "designCentre": Centre,
        "dessalle": Salle,
        "MedecinM": medecinM,
        "MedecinP": medecinP,
        "objet": objet,
        "email": email,
        "Organisme": organisme,
        "telperson": telperson,
        "Tel": tel,
        "codeMed": codeMed,
        "codeSalle": codeSalle,
        "designation": designation,
        "designationExam": Exam,
        "id": id,
        "listRdvAndPK": listRdvAndPk?.toJson(),
        "nomCli": nomCli,
        "prenom": prenom,
        "Daterdv": Daterdv,
        "Heurerdv": Heurerdv,
      };

  @override
  String toString() {
    return 'RendezVous{codeCentre: $codeCentre, designCentre: $Centre, dessalle: $Salle, medecinM: $medecinM, medecinP: $medecinP, objet: $objet, Daterdv: $Daterdv , Heurerdv: $Heurerdv, email: $email, organisme: $organisme, telperson: $telperson, tel: $tel, codeMed: $codeMed, codeSalle: $codeSalle, designation: $designation, designationExam: $Exam, id: $id, listRdvAndPk: ${listRdvAndPk.toString()}, nomCli: $nomCli, prenom: $prenom}';
  }
}

class ListRdvAndPk {
  ListRdvAndPk({
    this.codexam,
    this.heureRdv,
    this.numRdv,
  });

  String? codexam;
  DateTime? heureRdv;
  String? numRdv;

  factory ListRdvAndPk.fromJson(Map<String, dynamic> json) => ListRdvAndPk(
        codexam: json["codexam"],
        heureRdv: DateTime.parse(json["heureRDV"]),
        numRdv: json["numRdv"],
      );

  Map<String, dynamic> toJson() => {
        "codexam": codexam,
        "heureRDV": heureRdv?.toIso8601String(),
        "numRdv": numRdv,
      };
  @override
  String toString() {
    return 'ListRdvAndPk{codexam: $codexam, heureRdv: $heureRdv, numRdv: $numRdv}';
  }
}
