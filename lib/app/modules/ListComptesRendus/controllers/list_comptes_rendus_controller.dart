import 'package:get/get.dart';
import 'package:radiologiev2/app/data/Services/ServiceCompteRendu.dart';
import 'package:radiologiev2/app/data/models/CompteRmodel.dart';

class ListComptesRendusController extends GetxController {
  final ServiceCompteRendu serviceCompteRendu = ServiceCompteRendu();
  RxList<CompteRendu> listCompte = List<CompteRendu>.empty(growable: true).obs;
  RxList<CompteRendu> Patienttrouve = <CompteRendu>[].obs;
  RxBool isLoaded = false.obs;
  RxBool isSearching = false.obs;
  RxString searchInput = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchCompteRendu();
    isLoaded.value = false;
  }

  fetchCompteRendu() async {
    print("aaaaaaaaaaaaaaaa");
    var comptes = await ServiceCompteRendu.fetchCompteRendu();
    if (comptes != null) {
      listCompte.value = comptes;
      Patienttrouve.value = listCompte;
      // ignore: empty_statements
    }
    print("liste compte ${listCompte}".toString());
    return listCompte;
  }

  void changeStatus(bool change) {
    isSearching.value = change;
  }

  searchPatient(String input) {
    List<CompteRendu> results = listCompte
        .where((element) => element.patient
            .toString()
            .toLowerCase()
            .contains(input.toLowerCase()))
        .toList();
    Patienttrouve.value = results.obs;
  }
}
