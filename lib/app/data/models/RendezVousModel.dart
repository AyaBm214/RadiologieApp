// To parse this JSON data, do
//
//     final rendezVous = rendezVousFromJson(jsonString);

import 'dart:convert';

List<RendezVous> rendezVousFromJson(String str) =>
    List<RendezVous>.from(json.decode(str).map((x) => RendezVous.fromJson(x)));

String rendezVousToJson(List<RendezVous> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RendezVous {
  RendezVous(
      {this.listRdvAndPk,
      this.id,
      this.codeCentre,
      this.centre,
      this.codeSalle,
      this.designation,
      this.prenom,
      this.nomCli,
      this.designationExam,
      this.codeMed,
      this.codeMedPres,
      this.confirme,
      this.nomMed,
      this.organisme,
      this.email,
      this.objet,
      this.medecinP,
      this.Exam,
      this.Daterdv,
      this.Heurerdv,
      this.Datebirth,
      this.telperson,
      this.tel});

  ListRdvAndPk? listRdvAndPk;
  String? id;
  String? codeCentre;
  String? centre;
  int? codeSalle;
  String? designation;
  String? prenom;
  String? nomCli;
  String? designationExam;
  String? codeMed;
  String? codeMedPres;
  bool? confirme;
  String? nomMed;
  String? medecinP;
  String? objet;
  String? email;
  String? organisme;
  String? Exam;
  DateTime? Daterdv;
  DateTime? Heurerdv;
  DateTime? Datebirth;
  String? tel;
  String? telperson;

  factory RendezVous.fromJson(Map<String, dynamic> json) => RendezVous(
        listRdvAndPk: ListRdvAndPk.fromJson(json["listRdvAndPK"]),
        id: json["id"],
        codeCentre: json["codeCentre"],
        centre: json["centre"],
        codeSalle: json["codeSalle"],
        designation: json["designation"],
        prenom: json["prenom"],
        nomCli: json["nomCli"],
        designationExam: json["designationExam"],
        codeMed: json["codeMed"],
        codeMedPres: json["codeMedPres"],
        confirme: json["confirme"],
        nomMed: json["nomMed"],
      );

  Map<String, dynamic> toJson() => {
        "listRdvAndPK": listRdvAndPk!.toJson(),
        "id": id,
        "codeCentre": codeCentre,
        "centre": centre,
        "codeSalle": codeSalle,
        "designation": designation,
        "prenom": prenom,
        "nomCli": nomCli,
        "designationExam": designationExam,
        "codeMed": codeMed,
        "codeMedPres": codeMedPres,
        "confirme": confirme,
        "nomMed": nomMed,
      };

  @override
  String toString() {
    return 'RendezVous{listRdvAndPk: $listRdvAndPk, id: $id, codeCentre: $codeCentre, centre: $centre, codeSalle: $codeSalle, designation: $designation, prenom: $prenom, nomCli: $nomCli, designationExam: $designationExam, codeMed: $codeMed, codeMedPres: $codeMedPres, confirme: $confirme, nomMed: $nomMed, medecinP: $medecinP, objet: $objet, email: $email, organisme: $organisme, Exam: $Exam, Daterdv: $Daterdv, Heurerdv: $Heurerdv, Datebirth: $Datebirth, tel: $tel, telperson: $telperson}';
  }
}

class ListRdvAndPk {
  ListRdvAndPk({
    this.codexam,
    this.numRdv,
    this.dateRdv,
    this.heureRdv,
  });

  String? codexam;
  String? numRdv;
  int? dateRdv;
  int? heureRdv;

  factory ListRdvAndPk.fromJson(Map<String, dynamic> json) => ListRdvAndPk(
        codexam: json["codexam"],
        numRdv: json["numRdv"],
        dateRdv: json["dateRDV"],
        heureRdv: json["heureRDV"],
      );

  Map<String, dynamic> toJson() => {
        "codexam": codexam,
        "numRdv": numRdv,
        "dateRDV": dateRdv,
        "heureRDV": heureRdv,
      };

  @override
  String toString() {
    return 'ListRdvAndPk{codexam: $codexam, numRdv: $numRdv, dateRdv: $dateRdv, heureRdv: $heureRdv}';
  }
}
