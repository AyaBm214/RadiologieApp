import 'package:get/get.dart';
import 'package:radiologiev2/app/data/Services/ServiceCompteRendu.dart';
import 'package:radiologiev2/app/data/models/CompteRmodel.dart';

class ListComptesRendusController extends GetxController {
  final ServiceCompteRendu serviceCompteRendu = ServiceCompteRendu();
  RxList<CompteRendu> listCompte = List<CompteRendu>.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
  }

  fetchCompteRendu() async {
    print("aaaaaaaaaaaaaaaa");
    var comptes = await ServiceCompteRendu.fetchCompteRendu();
    if (comptes != null) {
      listCompte.value = comptes;
      // ignore: empty_statements
    }
    print("liste compte ${listCompte}");
  }
}
