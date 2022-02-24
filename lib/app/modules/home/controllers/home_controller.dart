

import 'package:get/get.dart';
import 'package:radiologiev2/app/data/webService.dart';
import 'package:radiologiev2/models/CliniqueModel.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final WebService cliniqueWebServices =WebService();
  List<clinique> listcliniques= [];
  RxBool isLoaded=false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    fetchClinique();
    init();
    super.onInit();
    isLoaded.value=false;
  }
  Future init() async {
    var clinique = await cliniqueWebServices.listCliniques();
    setState(() => this.listcliniques = listcliniques);
    }

    Future fetchClinique() async {
    print("***************Fetching clinique********************");
    var cliniques = await cliniqueWebServices.listCliniques();
    if (cliniques != null) {
      listcliniques= cliniques ;

    }
    return listcliniques;
  }

  void setState(List<clinique> Function() param0) {}



}