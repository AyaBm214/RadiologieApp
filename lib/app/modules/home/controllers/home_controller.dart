

import 'package:get/get.dart';
import 'package:radiologiev2/app/data/webService.dart';
import 'package:radiologiev2/models/CliniqueModel.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final WebService cliniqueWebServices = WebService();
  List<clinique> listcliniques = [];
  RxList<clinique> Cliniquetrouve =<clinique>[].obs;
  RxBool isLoaded = false.obs;
  RxBool isSearching= false.obs;
  RxString searchInput="".obs;
  final count = 0.obs;

  @override
  void onInit() {
    fetchClinique();
    super.onInit();
    isLoaded.value = false;
  }


  void changeStatus(bool change) {
    isSearching.value=change ;
  }


    Future fetchClinique() async {
    print("***************Fetching clinique********************");
    var cliniques = await cliniqueWebServices.listCliniques();
    if (cliniques != null) {
      listcliniques= cliniques ;
      Cliniquetrouve.value=listcliniques.obs ;
    }
    return listcliniques;
  }
  searchClinique(String input){
    List<clinique> results=listcliniques.where((element) => element.nom.toString()
        .toLowerCase()
        .contains(input.toLowerCase())).toList();
    Cliniquetrouve.value = results.obs ;
  }





}