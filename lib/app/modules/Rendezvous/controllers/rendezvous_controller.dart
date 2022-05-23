import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_agenda/flutter_agenda.dart';
import 'package:get/get.dart';
import 'package:radiologiev2/app/data/Services/ServiceCenter.dart';
import 'package:radiologiev2/app/data/Services/ServiceExam.dart';
import 'package:radiologiev2/app/data/Services/ServiceMedcin.dart';
import 'package:radiologiev2/app/data/Services/ServiceOrganisme.dart';
import 'package:radiologiev2/app/data/Services/ServiceRendezVous.dart';
import 'package:radiologiev2/app/data/Services/ServiceSalle.dart';
import 'package:radiologiev2/app/data/models/CenterModel.dart';
import 'package:radiologiev2/app/data/models/ExamModel.dart';
import 'package:radiologiev2/app/data/models/Medcin.dart';
import 'package:radiologiev2/app/data/models/OrganismeModel.dart';
import 'package:radiologiev2/app/data/models/RendezVousModel.dart';
import 'package:radiologiev2/app/data/models/SalleModel.dart';

class RendezvousController extends GetxController {
  final ServiceCenter _serviceCenter = ServiceCenter();
  RxList<Centerv> listCenter = List<Centerv>.empty(growable: true).obs;
  Rx<Centerv> Lcenterv = Centerv().obs;
  Rx<Centerv> LcentervRDV = Centerv().obs;
  Rx<Centerv> LcentervCR = Centerv().obs;
  final ServiceMedecin service_medecin = ServiceMedecin();
  final ServiceRendezVous serviceRendezVous = ServiceRendezVous();
  RxList<Medecin> listMedecin = List<Medecin>.empty(growable: true).obs;
  RxList<Medecin> listMedecinP = List<Medecin>.empty(growable: true).obs;
  RxList<Medecin> listMedecinM = List<Medecin>.empty(growable: true).obs;
  Rx<Medecin> LMedecin = Medecin(codMed: '').obs;
  Rx<Medecin> LMedecinP = Medecin(codMed: '').obs;
  Rx<Medecin> LMedecinM = Medecin(codMed: '').obs;
  final ServiceOrganisme serviceOrganisme = ServiceOrganisme();
  RxList<Organisme> listOrganisme = List<Organisme>.empty(growable: true).obs;
  RxList<RendezVous> listRendezVous =
      List<RendezVous>.empty(growable: true).obs;
  Rx<Organisme> LOrganisme = Organisme().obs;
  final ServiceExam serviceExam = ServiceExam();
  RxList<Exam> listExam = List<Exam>.empty(growable: true).obs;
  Rx<Exam> LExam = Exam().obs;
  final ServiceSalle serviceSalle = ServiceSalle();
  RxList<Salle> listSalle = List<Salle>.empty(growable: true).obs;
  Rx<Salle> Lsalle = Salle().obs;
  Rx<Salle> LsalleCentre = Salle().obs;
  RxList<Pillar> sallesCalendar = List<Pillar>.empty(growable: true).obs;
  String? defaultLocale;
  Rx<DateTime> date =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .obs;

  @override
  List<AgendaEvent> getEvents(int codeSalle) {
    List<AgendaEvent> listEvents = List.empty(growable: true);
    log(listRendezVous.toString());

    listRendezVous.forEach((element) {
      log("qqqqqqqqqqqqqqqqqqq");
      log(element.codeSalle!.toString());
      log(codeSalle.toString());
      if (element.codeSalle!.compareTo(codeSalle) == 0) {
        log(element.codeSalle.toString());
        log("++++++++++++++");
        log(codeSalle.toString());
        listEvents.add(AgendaEvent(
          //padding: EdgeInsets.symmetric(horizontal: 30),
          title: "",
          subtitle: element.nomCli!,
          backgroundColor: Colors.red,
          start: EventTime(
              hour: DateTime.fromMillisecondsSinceEpoch(
                      element.listRdvAndPk!.heureRdv!)
                  .hour,
              minute: DateTime.fromMillisecondsSinceEpoch(
                      element.listRdvAndPk!.heureRdv!)
                  .minute),
          end: EventTime(
              hour: DateTime.fromMillisecondsSinceEpoch(
                      element.listRdvAndPk!.heureRdv!)
                  .hour,
              minute: DateTime.fromMillisecondsSinceEpoch(
                          element.listRdvAndPk!.heureRdv!)
                      .minute +
                  15),
        ));
      }
    });
    return listEvents;
  }

  Future<void> onInit() async {
    await fetchCenter();
    await fetchMedecin();
    await fetchOrganisme();
    await fetchExam();
    await fetchRendezVous(date.value.millisecondsSinceEpoch);
    await fetchSallesByCeentre(Lcenterv.value.codeCentre!);

    fetchEvents();
  }

  fetchEvents() {
    listSalle.forEach((element) {
      log(element.codeSalle.toString());
      sallesCalendar.add(Pillar(
        head: PillarHead(title: element.designation!, width: 200),
        events: getEvents(element.codeSalle!),
      ));
    });
  }

  fetchRendezVous(int date) async {
    print("***************Fetching RDV********************");
    var RendezVous =
        await serviceRendezVous.RendezVous(date, Lcenterv.value.codeCentre!);
    if (RendezVous != null) {
      log("eeeeeeeeeeeeeeeeee");
      log(RendezVous.toString());
      listRendezVous.value = RendezVous;
    }
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
      log("yyyyyyyyyyyyyyyyyyyyyyyyyyyyy");
      log(centers.toString());
      Lcenterv.value =
          listCenter.firstWhere((element) => element.codeCentre == "0");
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
    var Organismes = await serviceOrganisme.fetchOrganisme();
    if (Organismes != null) {
      listOrganisme.value = Organismes;
    }
  }

  fetchExam() async {
    print("***************Fetching Exam********************");
    var Exames = await serviceExam.fetchExam();
    if (Exames != null) {
      listExam.value = Exames;
    }
  }

  fetchSalle() async {
    print("***************Fetching Salle********************");
    var Salles = await serviceSalle.fetchSalle();
    if (Salles != null) {
      listSalle.value = Salles;
    }
  }

  fetchSallesByCeentre(String codeCenter) async {
    print("***************Fetching Salle********************");

    var Salles = await serviceSalle.fetchSalleByCentre(codeCenter);
    if (Salles != null) {
      listSalle.value = Salles;
    }

    log("++++++++++++++++++++++");
    log(listSalle.toString());
  }
}
