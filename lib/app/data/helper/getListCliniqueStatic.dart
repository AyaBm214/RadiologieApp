import 'package:radiologiev2/app/data/models/CliniqueModel.dart';

class GetListCliniqueStatic {
  static List<Clinique> listCliniquesStatic = List.empty(growable: true);

  static List<Clinique> getListStatic() {
    listCliniquesStatic.add(Clinique(
        code: "DEM02",
        id: "569",
        nom: "Csys Test",
        module: "Comptes_Rendu",
        url: "http://41.226.168.150:9015",
        urllocal: "http://41.226.168.150:9015"));
    listCliniquesStatic.add(Clinique(
        code: "PAS01",
        id: "81",
        nom: "Pasteur",
        module: "Comptes_Rendu",
        url: "http://197.14.51.133:9006",
        urllocal: "http://197.14.51.133:9006"));
    return listCliniquesStatic;
  }
}
