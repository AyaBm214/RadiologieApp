import 'package:get/get.dart';
import 'package:radiologiev2/app/data/Services/webService.dart';
import 'package:radiologiev2/app/data/helper/getListCliniqueStatic.dart';
import 'package:radiologiev2/app/data/models/CliniqueModel.dart';
import 'package:radiologiev2/app/data/models/authentification.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final WebService cliniqueWebServices = WebService();
  List<Clinique> listcliniques = [];
  RxList<Clinique> Cliniquetrouve = <Clinique>[].obs;
  RxBool isLoaded = false.obs;
  RxBool isSearching = false.obs;
  RxString searchInput = "".obs;
  Authentification configuration = Authentification();

  @override
  void onInit() {
    super.onInit();
    isLoaded.value = false;
  }

  void changeStatus(bool change) {
    isSearching.value = change;
  }

  Future fetchClinique() async {
    print("***************Fetching clinique********************");
    var cliniques = await cliniqueWebServices.listCliniques();
    // var cliniques = await cliniqueWebServices.listCliniques();
    if (cliniques != null) {
      listcliniques = cliniques;
      Cliniquetrouve.value = cliniques;
      cliniques = GetListCliniqueStatic.getListStatic();
    }
  }

  searchClinique(String input) {
    List<Clinique> results = listcliniques
        .where((element) =>
            element.nom.toString().toLowerCase().contains(input.toLowerCase()))
        .toList();
    Cliniquetrouve.value = results.obs;
  }
}
