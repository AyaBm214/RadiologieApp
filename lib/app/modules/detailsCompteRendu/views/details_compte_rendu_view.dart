import 'dart:core';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:radiologiev2/app/data/Services/ServiceUser.dart';
import 'package:radiologiev2/app/data/models/CompteRmodel.dart';
import 'package:radiologiev2/app/modules/detailsCompteRendu/controllers/details_compte_rendu_controller.dart';
import 'package:responsive_grid/responsive_grid.dart';

DetailsCompteRenduController CompteController =
    Get.put(DetailsCompteRenduController());

late List<CompteRendu> listCompte;

class DetailsCompteRenduView extends GetView<DetailsCompteRenduController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Détails Compte Rendu"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Row(mainAxisSize: MainAxisSize.min, children: [
                  DateTime.now().year -
                              DateTime.fromMillisecondsSinceEpoch(
                                      ServiceUser.configuration.Datenai)
                                  .year >
                          3
                      ? DateTime.now().year -
                                  DateTime.fromMillisecondsSinceEpoch(
                                          ServiceUser.configuration.Datenai)
                                      .year >
                              60
                          ? ServiceUser.configuration.sex!
                              ? const CircleAvatar(
                                  radius: 50.0,
                                  backgroundImage:
                                      AssetImage('assets/images/OldMan.jpg'),
                                  backgroundColor: Colors.transparent,
                                )
                              : const CircleAvatar(
                                  radius: 50.0,
                                  backgroundImage:
                                      AssetImage('assets/images/OldFemale.jpg'),
                                  backgroundColor: Colors.transparent,
                                )
                          : ServiceUser.configuration.sex!
                              ? const CircleAvatar(
                                  radius: 50.0,
                                  backgroundImage: AssetImage(
                                      'assets/images/MaleAvatar.jpg'),
                                  backgroundColor: Colors.transparent,
                                )
                              : const CircleAvatar(
                                  radius: 50.0,
                                  backgroundImage: AssetImage(
                                      'assets/images/female2Avatar.jpg'),
                                  backgroundColor: Colors.transparent,
                                )
                      : const CircleAvatar(
                          radius: 50.0,
                          backgroundImage: AssetImage('assets/images/bébé.jpg'),
                          backgroundColor: Colors.transparent,
                        )
                ]),
                title: Text(
                  ServiceUser.configuration.patient!,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15.0),
                ),
                subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "NumDoss : " + ServiceUser.configuration.numDoss!,
                      ),
                      Text(
                        "identifiant : " +
                            ServiceUser.configuration.identifiant!,
                      ),
                    ]),
              ),
            ),
            customDivider("Details Compte Rendu "),
            Container(
                height: Get.height * 0.5,
                width: Get.width * 0.9,
                margin: const EdgeInsets.all(20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Row(
                            children: [
                              ResponsiveGridCol(
                                  xs: 3,
                                  child: Text(
                                    "Centre : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent),
                                  )),
                              ResponsiveGridCol(
                                  child: Text(
                                      ServiceUser.configuration.NomCentre!))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Row(
                            children: [
                              ResponsiveGridCol(
                                  xs: 3,
                                  child: const Text(
                                    "Exa- : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent),
                                  )),
                              ResponsiveGridCol(
                                  child: Text(ServiceUser.configuration.Exa!))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Row(
                            children: [
                              ResponsiveGridCol(
                                  xs: 3,
                                  child: const Text(
                                    "Date :",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent),
                                  )),
                              ResponsiveGridCol(
                                  child: Text(
                                      DateTime.fromMillisecondsSinceEpoch(
                                              ServiceUser
                                                  .configuration.dateArrive!)
                                          .toString()
                                          .split("  ")
                                          .first))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Row(
                            children: [
                              ResponsiveGridCol(
                                  xs: 3,
                                  child: Text(
                                    "Etat : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent),
                                  )),
                              ResponsiveGridCol(
                                  child: Text(ServiceUser.configuration.etat!))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Row(
                            children: [
                              ResponsiveGridCol(
                                  xs: 3,
                                  child: Text(
                                    "Renseignement  : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent),
                                  )),
                              ResponsiveGridCol(
                                  child: Text(
                                      ServiceUser.configuration.renseignement!))
                            ],
                          ),
                        ),
                        //Padding(
                        //padding: const EdgeInsets.only(top: 15.0),
                        //child: Row(
                        //children: [
                        //ResponsiveGridCol(
                        //  xs: 3,
                        // child: Text(
                        //  "Arrivé(e) le :",
                        //  style:
                        //     TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent),
                        //  )),
                        // ResponsiveGridCol(
                        //   child: Text(
                        //    DateTime.fromMillisecondsSinceEpoch(
                        //         ServiceUser
                        //             .configuration.dateArrive!)
                        //     .toString()
                        //     .replaceAll(":00.000", "")))
                        // ],
                        // ),
                        //   ),
                        if (ServiceUser.configuration.dureeAttente != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Row(
                              children: [
                                ResponsiveGridCol(
                                    xs: 3,
                                    child: Text(
                                      " Durée en Attente:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent),
                                    )),
                                ResponsiveGridCol(child: Text(""))
                              ],
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Row(
                            children: [
                              ResponsiveGridCol(
                                  xs: 3,
                                  child: Text(
                                    "Durée en Salle :",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent),
                                  )),
                              ResponsiveGridCol(
                                  child: Text(
                                      ServiceUser.configuration.dureeEnSalle!))
                            ],
                          ),
                        ),
                        if (ServiceUser.configuration.dureeAttente != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Row(
                              children: [
                                ResponsiveGridCol(
                                    xs: 3,
                                    child: Text(
                                      "Dureé Totale :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent),
                                    )),
                                ResponsiveGridCol(
                                    child: Text(
                                        ServiceUser.configuration.dureeAttente))
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                )),
            customDivider("Historique Patient"),
          ],
        ),
      ),
    );
  }

  customDivider(String title) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.white,
            height: 20,
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: Colors.white,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  FontAwesomeIcons.solidFileAlt,
                  size: 15,
                  color: Colors.red,
                ),
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            height: 20,
          ),
        ),
      ],
    );
  }
}
