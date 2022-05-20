import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:radiologiev2/app/data/Services/ServiceUser.dart';
import 'package:radiologiev2/app/data/models/Exploration.dart';
import 'package:radiologiev2/app/modules/Exploitation/controllers/exploitation_controller.dart';
import 'package:radiologiev2/app/routes/app_pages.dart';

ExploitationController CompteExploController =
    Get.put(ExploitationController());

Widget buildListCompteRenduExplo() {
  return Obx(() => ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: CompteExploController.Patienttrouve.length,
      itemBuilder: (BuildContext context, int index) {
        CompteRenduExploration compteRenduExplo =
            CompteExploController.Patienttrouve[index];
        return Card(
          child: InkWell(
            onTap: () {
              CompteExploController.configuration.numDossset =
                  compteRenduExplo.nDossier;
              CompteExploController.configuration.identifiantset =
                  compteRenduExplo.identifiant;
              CompteExploController.configuration.patientset =
                  compteRenduExplo.patient;
              CompteExploController.configuration.daitnaissanceset =
                  compteRenduExplo.datNai;
              CompteExploController.configuration.sexset = compteRenduExplo.sex;
              CompteExploController.configuration.Centrenomset =
                  compteRenduExplo.centre;
              CompteExploController.configuration.Exaset =
                  compteRenduExplo.designation;
              CompteExploController.configuration.dateset =
                  compteRenduExplo.dateExecution;
              CompteExploController.configuration.etatset =
                  compteRenduExplo.etat;
              CompteExploController.configuration.dateArrivset =
                  compteRenduExplo.date;
              CompteExploController.configuration.dureeAttenset =
                  compteRenduExplo.dureeAttente;
              CompteExploController.configuration.dureeEnSalleset =
                  compteRenduExplo.dureeEnSalleEnMinute;
              CompteExploController.configuration.heureset =
                  compteRenduExplo.heure;

              ServiceUser.configuration.numDoss = compteRenduExplo.nDossier;
              ServiceUser.configuration.heure = compteRenduExplo.heure;

              ServiceUser.configuration.patient = compteRenduExplo.patient;
              ServiceUser.configuration.sex = compteRenduExplo.sex;
              ServiceUser.configuration.Datenai = compteRenduExplo.datNai;
              ServiceUser.configuration.identifiant =
                  compteRenduExplo.identifiant;
              ServiceUser.configuration.NomCentre = compteRenduExplo.centre;
              ServiceUser.configuration.Exa = compteRenduExplo.designation;
              ServiceUser.configuration.date = compteRenduExplo.dateExecution;
              ServiceUser.configuration.etat = compteRenduExplo.etat;
              ServiceUser.configuration.dateArrive = compteRenduExplo.date;
              ServiceUser.configuration.dureeEnSalle =
                  compteRenduExplo.dureeEnSalleEnMinute!;
              ServiceUser.configuration.dureeAttente =
                  compteRenduExplo.dureeAttente;
            },
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  child: Slidable(
                    // Specify a key if the Slidable is dismissible.
                    key: const ValueKey(0),

                    // The start action pane is the one at the left or the top side.
                    startActionPane: const ActionPane(
                      // A motion is a widget used to control how the pane animates.
                      motion: ScrollMotion(),
                      // A pane can dismiss the Slidable.
                      // All actions are defined in the children parameter.
                      children: [
                        // A SlidableAction can have an icon and/or a label.
                        SlidableAction(
                          onPressed: details,
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
                                              compteRenduExplo.datNai)
                                          .year >
                                  3
                              ? DateTime.now().year -
                                          DateTime.fromMillisecondsSinceEpoch(
                                                  compteRenduExplo.datNai)
                                              .year >
                                      60
                                  ? compteRenduExplo.sex
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
                                  : compteRenduExplo.sex
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
                          compteRenduExplo.patient.toString(),
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
                                            compteRenduExplo.date)
                                        .toString()
                                        .split(" ")
                                        .first +
                                    " à " +
                                    DateTime.fromMillisecondsSinceEpoch(
                                            compteRenduExplo.heure)
                                        .toString()
                                        .split(" ")
                                        .last
                                        .replaceAll(":00.000", ""),
                              ),
                              Text(
                                "EXAMEN : " +
                                    compteRenduExplo.designation.toString(),
                              ),
                              Text(
                                "Med Trt: " +
                                    compteRenduExplo.medecinDictee.toString(),
                              ),
                              Text(
                                "Attente:" +
                                    compteRenduExplo.dureeAttente.toString(),
                              ),
                            ]),
                        trailing:
                            Row(mainAxisSize: MainAxisSize.min, children: [
                          if (compteRenduExplo.etat == "enAttente") ...[
                            const Icon(
                              Icons.alarm_on_rounded,
                              color: Colors.blue,
                              size: 30.0,
                            ),
                          ],
                          if (compteRenduExplo.etat == "dictee") ...[
                            const Icon(
                              Icons.mic,
                              color: Colors.blue,
                              size: 30.0,
                            ),
                          ],
                          if (compteRenduExplo.enSalle == true) ...[
                            const Icon(
                              Icons.door_back_door,
                              color: Colors.blue,
                              size: 30.0,
                            ),
                          ],
                          if (compteRenduExplo.etat == "valide") ...[
                            const Icon(
                              Icons.verified,
                              color: Colors.greenAccent,
                              size: 30.0,
                            ),
                          ],
                          if (compteRenduExplo.livre == true) ...[
                            const Icon(
                              Icons.done_all,
                              color: Colors.greenAccent,
                              size: 36.0,
                            ),
                          ],
                          if (compteRenduExplo.etat == "ecrit") ...[
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
          ),
        );
      }));
}

void doNothing(BuildContext context) {}
void details(BuildContext context) {
  Get.toNamed(Routes.DETAILS_COMPTE_RENDU);
}
