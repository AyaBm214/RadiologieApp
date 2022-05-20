class Authentification {
  String? username;
  String? NomClinique;
  String? url;
  String? codeCli;
  String? descriptionUser;
  String? numDoss;
  String? identifiant;
  String? patient;
  dynamic? Datenai;
  bool? sex = true;
  String? NomCentre;
  String? Exa;
  String? etat;
  dynamic? date;
  dynamic? dateArrive;
  dynamic? dureeAttente;
  dynamic? dureeEnSalle;
  dynamic? dureeTotale;
  String? renseignement;
  dynamic? heure;

  dynamic get getheure => heure;
  String get getCentrenom => NomCentre!;
  String get getExa => Exa!;
  String get getetat => etat!;
  dynamic get getdatearrive => dateArrive;
  dynamic get getdureeAtt => dureeAttente;
  dynamic get getdureeSalle => dureeEnSalle;
  dynamic get getdureeTotale => dureeTotale;
  String get getrensei => renseignement!;
  String get getNomClinique => NomClinique!;
  String get getCodeCli => codeCli!;
  String get getDescrpUser => descriptionUser!;
  String get getnumDoss => numDoss!;
  String get getidentifiant => identifiant!;
  String get getpatientname => patient!;
  bool get getsexpatient => sex!;
  dynamic get getdatnaissancePatient => Datenai;
  dynamic get getDate => date;

  void set heureset(dynamic value) {
    heure = value;
  }

  void set numDossset(String value) {
    numDoss = value;
  }

  void set dateset(dynamic value) {
    date = value;
  }

  void set Centrenomset(String value) {
    NomCentre = value;
  }

  void set Exaset(String value) {
    Exa = value;
  }

  void set etatset(String value) {
    etat = value;
  }

  void set dateArrivset(dynamic value) {
    dateArrive = value;
  }

  void set dureeAttenset(dynamic value) {
    dureeAttente = value;
  }

  void set dureeEnSalleset(dynamic value) {
    dureeEnSalle = value;
  }

  void set dureeTotaleset(dynamic value) {
    dureeTotale = value;
  }

  void set renseigset(String value) {
    renseignement = value;
  }

  void set daitnaissanceset(dynamic value) {
    Datenai = value;
  }

  void set sexset(bool value) {
    sex = value;
  }

  void set patientset(String value) {
    patient = value;
  }

  void set identifiantset(String value) {
    identifiant = value;
  }

  void set NomCliniquetset(String value) {
    NomClinique = value;
  }

  void set DescriptionUserset(String value) {
    NomClinique = value;
  }

  void set CodeCliset(String value) {
    codeCli = value;
  }

  String get getusername => username!;

  void set usernameset(String value) {
    username = value;
  }

  String get geturl => url!;

  set urlset(String value) {
    url = value;
  }
}
