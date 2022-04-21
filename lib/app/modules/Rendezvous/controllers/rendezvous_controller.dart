import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_agenda/flutter_agenda.dart';
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
  final ServiceCenter _serviceCenter = ServiceCenter();
  RxList<Centerv> listCenter = List<Centerv>.empty(growable: true).obs;
  Rx<Centerv> Lcenterv = Centerv().obs;
  final ServiceMedecin service_medecin = ServiceMedecin();
  RxList<Medecin> listMedecin = List<Medecin>.empty(growable: true).obs;
  RxList<Medecin> listMedecinP = List<Medecin>.empty(growable: true).obs;
  RxList<Medecin> listMedecinM = List<Medecin>.empty(growable: true).obs;
  Rx<Medecin> LMedecin = Medecin(codMed: '').obs;
  Rx<Medecin> LMedecinP = Medecin(codMed: '').obs;
  Rx<Medecin> LMedecinM = Medecin(codMed: '').obs;
  final ServiceOrganisme so = ServiceOrganisme();
  RxList<Organisme> listOrganisme = List<Organisme>.empty(growable: true).obs;
  Rx<Organisme> LOrganisme = Organisme().obs;
  final ServiceExam se = ServiceExam();
  RxList<Exam> listExam = List<Exam>.empty(growable: true).obs;
  Rx<Exam> LExam = Exam().obs;
  final ServiceSalle ss = ServiceSalle();
  RxList<Salle> listSalle = List<Salle>.empty(growable: true).obs;
  Rx<Salle> Lsalle = Salle().obs;
  RxList<Pillar> resources = List<Pillar>.empty(growable: true).obs;

  @override
  void onInit() {
    fetchCenter();
    fetchMedecin();
    fetchOrganisme();
    fetchExam();
    fetchSalle();
    resources.value = [
      Pillar(
        head: PillarHead(title: 'Salle', object: 1),
        events: [
          AgendaEvent(
            title: 'Meeting D',
            subtitle: 'MD',
            backgroundColor: Colors.red,
            start: EventTime(hour: 15, minute: 0),
            end: EventTime(hour: 16, minute: 30),
          ),
          AgendaEvent(
            title: 'Meeting Z',
            subtitle: 'MZ',
            start: EventTime(hour: 12, minute: 0),
            end: EventTime(hour: 13, minute: 20),
          ),
        ],
      ),
      Pillar(
        head: PillarHead(title: 'Resource 2', object: 2),
        events: [
          AgendaEvent(
            title: 'Meeting G',
            subtitle: 'MG',
            backgroundColor: Colors.yellowAccent,
            start: EventTime(hour: 9, minute: 10),
            end: EventTime(hour: 11, minute: 45),
          ),
        ],
      ),
      Pillar(
        head: PillarHead(title: 'Resource 3', object: 3, color: Colors.yellow),
        events: [
          AgendaEvent(
            title: 'Meeting A',
            subtitle: 'MA',
            start: EventTime(hour: 10, minute: 10),
            end: EventTime(hour: 11, minute: 45),
            onTap: () {
              print("meeting A Details");
            },
          ),
        ],
      ),
    ];
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
