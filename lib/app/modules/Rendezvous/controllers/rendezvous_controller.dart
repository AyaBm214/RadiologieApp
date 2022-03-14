import 'package:get/get.dart';
import 'package:radiologiev2/app/data/Services/ServiceCenter.dart';
import 'package:radiologiev2/app/data/Services/ServiceMedcin.dart';
import 'package:radiologiev2/app/data/Services/ServiceOrganisme.dart';
import 'package:radiologiev2/app/data/models/CenterModel.dart';
import 'package:radiologiev2/app/data/models/Medcin.dart';
import 'package:radiologiev2/app/data/models/OrganismeModel.dart';

class RendezvousController extends GetxController {}

class MedecinController extends GetxController {
  final ServiceMedecin service_medecin = ServiceMedecin();
  RxList<Medecin> listMedecin = <Medecin>[].obs;
  RxList<Medecin> listMedecinP = <Medecin>[].obs;
  RxList<Medecin> listMedecinM = <Medecin>[].obs;
  Rx<Medecin> LMedecin = Medecin(codMed: '').obs;
  Rx<Medecin> LMedecinP = Medecin(codMed: '').obs;
  Rx<Medecin> LMedecinM = Medecin(codMed: '').obs;

  @override
  void onInit() {
    fetchMedecin();
  }

  Future fetchMedecin() async {
    print("***************Fetching Medcin  ********************");
    var Medcins = await service_medecin.fetchMedcin();
    if (Medcins != null) {
      listMedecin.value = Medcins as List<Medecin>;
    }
    listMedecin.forEach((element) {
      if (element.typMed == "P") {
        listMedecinP.add(element);
      } else if (element.typMed == "M") {
        listMedecinM.add(element);
      }
    });
    return listMedecin;
  }
}

////////////////////////////////////////
class OrganismeController extends GetxController {
  final ServiceOrganisme so = ServiceOrganisme();
  RxList<Organisme> listOrganisme = <Organisme>[].obs;
  Rx<Organisme> LOrganisme = Organisme().obs;
  @override
  void onInit() {
    fetchOrganisme();
  }

  fetchOrganisme() async {
    print("***************Fetching Organisme********************");
    var Organismes = await so.fetchOrganisme();
    if (Organismes != null) {
      listOrganisme.value = Organismes;
    }
  }
}

//////////////////////////////////
class CenterController extends GetxController {
  final ServiceCenter _serviceCenter = ServiceCenter();
  RxList<Centerv> listCenter = <Centerv>[].obs;
  Rx<Centerv> Lcenterv = Centerv(
          indImage: null,
          kt: null,
          hopital: null,
          nature: null,
          codeCentre: '',
          designCentre: '')
      .obs;

  @override
  // ignore: must_call_super
  void onInit() {
    fetchCenter();
  }

  fetchCenter() async {
    print("***************Fetching center********************");
    var centers = await _serviceCenter.fetchCenter();
    if (centers != null) {
      listCenter.value = centers;
    }
    return listCenter;
  }
}
