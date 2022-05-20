import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:radiologiev2/app/data/Services/ServiceUser.dart';
import 'package:radiologiev2/app/data/models/CompteRmodel.dart';
import 'package:radiologiev2/app/modules/ListComptesRendus/controllers/list_comptes_rendus_controller.dart';
import 'package:radiologiev2/app/routes/app_pages.dart';

ListComptesRendusController Compte1Controller =
    Get.put(ListComptesRendusController());
Widget buildListCompteRendu() {
  return Obx(() => ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: Compte1Controller.Patienttrouve.length,
      itemBuilder: (BuildContext context, int index) {
        CompteRendu compteRendu = Compte1Controller.Patienttrouve[index];
        return Card(
          child: Column(
            children: [
              Card(
                elevation: 5,
                child: Slidable(
                  // Specify a key if the Slidable is dismissible.
                  key: const ValueKey(0),

                  // The start action pane is the one at the left or the top side.
                  startActionPane: ActionPane(
                    // A motion is a widget used to control how the pane animates.
                    motion: ScrollMotion(),
                    // A pane can dismiss the Slidable.
                    // All actions are defined in the children parameter.
                    children: [
                      // A SlidableAction can have an icon and/or a label.
                      SlidableAction(
                        onPressed: (context) => details(context, compteRendu),
                        backgroundColor: Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: FontAwesomeIcons.solidFileAlt,
                        label: 'Détails',
                      ),
                      SlidableAction(
                        onPressed: doNothing,
                        backgroundColor: Color(0xFF21B7CA),
                        foregroundColor: Colors.white,
                        icon: Icons.mic,
                        label: 'Dicter',
                      ),
                      SlidableAction(
                        onPressed: doNothing,
                        backgroundColor: Color(0xFF21B7CA),
                        foregroundColor: Colors.white,
                        icon: FontAwesomeIcons.xRay,
                        label: 'Viewer',
                      ),
                    ],
                  ),
                  endActionPane: const ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        // An action can be bigger than the others.
                        flex: 2,
                        onPressed: doNothing,
                        backgroundColor: Color(0xFF7BC043),
                        foregroundColor: Colors.white,
                        icon: FontAwesomeIcons.filePdf,
                        label: 'Compte Rendu',
                      ),
                      SlidableAction(
                        onPressed: doNothing,
                        backgroundColor: Color(0xFF0392CF),
                        foregroundColor: Colors.white,
                        icon: FontAwesomeIcons.headphones,
                        label: 'Ecouter',
                      ),
                    ],
                  ),
                  child: ListTile(
                      leading: Row(mainAxisSize: MainAxisSize.min, children: [
                        DateTime.now().year -
                                    DateTime.fromMillisecondsSinceEpoch(
                                            compteRendu.datNai)
                                        .year >
                                3
                            ? DateTime.now().year -
                                        DateTime.fromMillisecondsSinceEpoch(
                                                compteRendu.datNai)
                                            .year >
                                    60
                                ? compteRendu.sex!
                                    ? const CircleAvatar(
                                        radius: 50.0,
                                        backgroundImage: AssetImage(
                                            'assets/images/OldMan.jpg'),
                                        backgroundColor: Colors.transparent,
                                      )
                                    : const CircleAvatar(
                                        radius: 50.0,
                                        backgroundImage: AssetImage(
                                            'assets/images/OldFemale.jpg'),
                                        backgroundColor: Colors.transparent,
                                      )
                                : compteRendu.sex!
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
                                backgroundImage:
                                    AssetImage('assets/images/bébé.jpg'),
                                backgroundColor: Colors.transparent,
                              )
                      ]),
                      title: Text(
                        compteRendu.patient!.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 15.0),
                      ),
                      subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "RDV:" +
                                  DateTime.fromMillisecondsSinceEpoch(
                                          compteRendu.date)
                                      .toString()
                                      .split(" ")
                                      .first +
                                  " à " +
                                  DateTime.fromMillisecondsSinceEpoch(
                                          compteRendu.heure)
                                      .toString()
                                      .split(" ")
                                      .last
                                      .replaceAll(":00.000", ""),
                            ),
                            Text(
                              "EXAMEN : " + compteRendu.designation.toString(),
                            ),
                            Text(
                              "Med Trt: " +
                                  compteRendu.medecinDictee.toString(),
                            ),
                            Text(
                              "Attente:" + compteRendu.dureeAttente.toString(),
                            ),
                          ]),
                      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                        if (compteRendu.etat == "enAttente") ...[
                          const Icon(
                            Icons.alarm_on_rounded,
                            color: Colors.blue,
                            size: 30.0,
                          ),
                        ],
                        if (compteRendu.etat == "dictee") ...[
                          const Icon(
                            Icons.mic,
                            color: Colors.blue,
                            size: 30.0,
                          ),
                        ],
                        if (compteRendu.enSalle == true) ...[
                          const Icon(
                            Icons.door_back_door,
                            color: Colors.blue,
                            size: 30.0,
                          ),
                        ],
                        if (compteRendu.etat == "valide") ...[
                          const Icon(
                            Icons.verified,
                            color: Colors.greenAccent,
                            size: 30.0,
                          ),
                        ],
                        if (compteRendu.livre == true) ...[
                          const Icon(
                            Icons.done_all,
                            color: Colors.greenAccent,
                            size: 36.0,
                          ),
                        ],
                        if (compteRendu.etat == "ecrit") ...[
                          const Icon(
                            Icons.edit,
                            color: Colors.greenAccent,
                            size: 36.0,
                          ),
                        ]
                      ])),
                ),
              )
            ],
          ),
        );
      }));
}

void doNothing(BuildContext context) {}
void details(BuildContext context, CompteRendu compteRendu) {
  log("*************************************");
  log(compteRendu.toString());
  ServiceUser.configuration.numDoss = compteRendu.nDossier!;
  ServiceUser.configuration.heure = compteRendu.heure!;

  ServiceUser.configuration.patient = compteRendu.patient!;
  ServiceUser.configuration.sex = compteRendu.sex!;
  ServiceUser.configuration.Datenai = compteRendu.datNai!;
  ServiceUser.configuration.renseignement = compteRendu.observ!;
  ServiceUser.configuration.identifiant = compteRendu.identifiant!;
  ServiceUser.configuration.NomCentre = compteRendu.centre!;
  ServiceUser.configuration.Exa = compteRendu.designation!;
  ServiceUser.configuration.date = compteRendu.dateExecution!;
  ServiceUser.configuration.etat = compteRendu.etat!;
  ServiceUser.configuration.dateArrive = compteRendu.date!;
  ServiceUser.configuration.dureeEnSalle = compteRendu.dureeensalle!;
  ServiceUser.configuration.dureeAttente = compteRendu.dureeAttente!;
  Get.toNamed(Routes.DETAILS_COMPTE_RENDU);
}
