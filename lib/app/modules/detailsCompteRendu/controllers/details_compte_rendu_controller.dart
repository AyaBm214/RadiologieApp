import 'package:get/get.dart';
import 'package:radiologiev2/app/data/Services/ServiceCompteRendu.dart';
import 'package:radiologiev2/app/data/models/CompteRmodel.dart';
import 'package:radiologiev2/app/data/models/authentification.dart';

class DetailsCompteRenduController extends GetxController {
  final ServiceCompteRendu serviceCompteRendu = ServiceCompteRendu();
  RxList<CompteRendu> listCompte = List<CompteRendu>.empty(growable: true).obs;
  RxList<CompteRendu> Patienttrouve = <CompteRendu>[].obs;
  Authentification configuration = Authentification();

  @override
  void onInit() {
    fetchCompteRendu();
  }

  fetchCompteRendu() async {
    print("aaaaaaaaaaaaaaaa");
    var comptes = await ServiceCompteRendu.fetchCompteRendu();
    if (comptes != null) {
      listCompte.value = comptes;
      Patienttrouve.value = listCompte;
      // ignore: empty_statements
    }
    return listCompte;
  }
}
