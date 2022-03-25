import 'dart:async';

import 'package:get/get.dart';
import 'package:radiologiev2/app/data/Services/ServiceCenter.dart';
import 'package:radiologiev2/app/data/Services/ServiceExam.dart';
import 'package:radiologiev2/app/data/Services/ServiceMedcin.dart';
import 'package:radiologiev2/app/data/Services/ServiceOrganisme.dart';
import 'package:radiologiev2/app/data/Services/ServiceSalle.dart';
import 'package:radiologiev2/app/data/models/CenterModel.dart';
import 'package:radiologiev2/app/data/models/ExamModel.dart';
import 'package:radiologiev2/app/data/models/Medcin.dart';
import 'package:radiologiev2/app/data/models/OrganismeModel.dart';
import 'package:radiologiev2/app/data/models/SalleModel.dart';

class RendezvousController extends GetxController {
  String? validator(String value) {
    if (value.isEmpty) {
      return "Please enter some text";
    }
    return null;
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }
}

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

////////////////////////////////////////
class ExamController extends GetxController {
  final ServiceExam se = ServiceExam();
  RxList<Exam> listExam = <Exam>[].obs;
  Rx<Exam> LExam = Exam().obs;
  @override
  void onInit() {
    fetchExam();
  }

  fetchExam() async {
    print("***************Fetching Exam********************");
    var Exames = await se.fetchExam();
    if (Exames != null) {
      listExam.value = Exames;
    }
  }
}
//////////////////////////////////////////////

class SalleController extends GetxController {
  final ServiceSalle ss = ServiceSalle();
  RxList<Salle> listSalle = <Salle>[].obs;
  Rx<Salle> Lsalle = Salle().obs;
  @override
  void onInit() {
    fetchSalle();
  }

  fetchSalle() async {
    print("***************Fetching Salle********************");
    var Salles = await ss.fetchSalle();
    if (Salles != null) {
      listSalle.value = Salles;
    }
  }
}
