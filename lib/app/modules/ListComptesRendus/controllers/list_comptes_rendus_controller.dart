import 'dart:developer';

import 'package:get/get.dart';
import 'package:radiologiev2/app/data/Services/ServiceCenter.dart';
import 'package:radiologiev2/app/data/Services/ServiceCompteRendu.dart';
import 'package:radiologiev2/app/data/models/CenterModel.dart';
import 'package:radiologiev2/app/data/models/CompteRmodel.dart';
import 'package:radiologiev2/app/data/models/authentification.dart';

class ListComptesRendusController extends GetxController {
  final ServiceCompteRendu serviceCompteRendu = ServiceCompteRendu();
  RxList<CompteRendu> listCompte = List<CompteRendu>.empty(growable: true).obs;
  RxList<CompteRendu> Patienttrouve = <CompteRendu>[].obs;
  RxList<Centerv> listCenter = List<Centerv>.empty(growable: true).obs;
  Rx<Centerv> LcentervCR = Centerv().obs;
  final ServiceCenter _serviceCenter = ServiceCenter();

  RxBool isLoaded = false.obs;
  RxBool isSearching = false.obs;
  RxString searchInput = "".obs;
  Authentification configuration = Authentification();

  @override
  void onInit() {
    super.onInit();
    fetchCenter();
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

  fetchCenter() async {
    print("***************Fetching center********************");
    var centers = await _serviceCenter.fetchCenter();
    if (centers != null) {
      listCenter.value = centers;
      log("yyyyyyyyyyyyyyyyyyyyyyyyyyyyy");
      log(centers.toString());
      LcentervCR.value =
          listCenter.firstWhere((element) => element.codeCentre == "0");
    }
    return listCenter;
  }
}
