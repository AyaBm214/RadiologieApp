import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
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
  final ServiceCenter _serviceCenter = ServiceCenter();
  RxList<Centerv> listCenter = <Centerv>[].obs;
  Rx<Centerv> Lcenterv = Centerv().obs;
  final ServiceMedecin service_medecin = ServiceMedecin();
  RxList<Medecin> listMedecin = <Medecin>[].obs;
  RxList<Medecin> listMedecinP = <Medecin>[].obs;
  RxList<Medecin> listMedecinM = <Medecin>[].obs;
  Rx<Medecin> LMedecin = Medecin(codMed: '').obs;
  Rx<Medecin> LMedecinP = Medecin(codMed: '').obs;
  Rx<Medecin> LMedecinM = Medecin(codMed: '').obs;
  final ServiceOrganisme so = ServiceOrganisme();
  RxList<Organisme> listOrganisme = <Organisme>[].obs;
  Rx<Organisme> LOrganisme = Organisme().obs;
  final ServiceExam se = ServiceExam();
  RxList<Exam> listExam = <Exam>[].obs;
  Rx<Exam> LExam = Exam().obs;
  final ServiceSalle ss = ServiceSalle();
  RxList<Salle> listSalle = <Salle>[].obs;
  Rx<Salle> Lsalle = Salle().obs;

  @override
  void onInit() {
    fetchCenter();
    fetchMedecin();
    fetchOrganisme();
    fetchExam();
    fetchSalle();
  }

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

  fetchCenter() async {
    print("***************Fetching center********************");
    var centers = await _serviceCenter.fetchCenter();
    if (centers != null) {
      listCenter.value = centers;
    }
    return listCenter;
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

  fetchOrganisme() async {
    print("***************Fetching Organisme********************");
    var Organismes = await so.fetchOrganisme();
    if (Organismes != null) {
      listOrganisme.value = Organismes;
    }
  }

  fetchExam() async {
    print("***************Fetching Exam********************");
    var Exames = await se.fetchExam();
    if (Exames != null) {
      listExam.value = Exames;
    }
  }

  fetchSalle() async {
    print("***************Fetching Salle********************");
    var Salles = await ss.fetchSalle();
    if (Salles != null) {
      listSalle.value = Salles;
    }
  }
}

setSelectedCentre(value) {}

calculateAge(DateTime birthDate) {
  DateTime currentDate = DateTime.now();
  int age = currentDate.year - birthDate.year;
  int month1 = currentDate.month;
  int month2 = birthDate.month;
  if (month2 > month1) {
    age--;
  } else if (month1 == month2) {
    int day1 = currentDate.day;
    int day2 = birthDate.day;
    if (day2 > day1) {
      age--;
    }
  }
  return age;
}
