class config {
  late String username;
  late String NomClinique;
  late String url;


  String get getNomClinique => NomClinique;


  void set NomCliniqueset(String value) {
    NomClinique = value;
  }

  String get getusername => username;

  void set usernameset(String value) {
    username = value;
  }

  String get geturl => url;

  set urlset(String value) {
    url = value;
  }
}