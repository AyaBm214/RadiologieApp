import 'package:get/get.dart';
import 'package:radiologiev2/app/data/Services/webService.dart';
import 'package:radiologiev2/app/data/models/CliniqueModel.dart';
import 'package:radiologiev2/app/data/models/authentification.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final WebService cliniqueWebServices = WebService();
  List<clinique> listcliniques = [];
  RxList<clinique> Cliniquetrouve = <clinique>[].obs;
  RxBool isLoaded = false.obs;
  RxBool isSearching = false.obs;
  RxString searchInput = "".obs;
  Authentification configuration = Authentification();
  final count = 0.obs;

  @override
  void onInit() {
    fetchClinique();
    super.onInit();
    isLoaded.value = false;
  }

  void changeStatus(bool change) {
    isSearching.value = change;
  }

  Future fetchClinique() async {
    print("***************Fetching clinique********************");
    var cliniques = await cliniqueWebServices.listCliniques();
    if (cliniques != null) {
      listcliniques = cliniques;
      Cliniquetrouve.value = listcliniques.obs;
    }
    return listcliniques;
  }

  searchClinique(String input) {
    List<clinique> results = listcliniques
        .where((element) =>
            element.nom.toString().toLowerCase().contains(input.toLowerCase()))
        .toList();
    Cliniquetrouve.value = results.obs;
  }
}
