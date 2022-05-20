import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:radiologiev2/app/data/Services/ServiceUser.dart';
import 'package:radiologiev2/app/data/models/CompteRenduBlocModel.dart';
import 'package:radiologiev2/app/modules/Bloc/controllers/bloc_controller.dart';
import 'package:radiologiev2/app/routes/app_pages.dart';

BlocController CompteBlocController = Get.put(BlocController());

Widget buildListCompteRenduBloc() {
  return Obx(() => ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: CompteBlocController.Patienttrouve.length,
      itemBuilder: (BuildContext context, int index) {
        CompteRenduBloc compteRenduBloc =
            CompteBlocController.Patienttrouve[index];
        return Card(
          child: InkWell(
            onTap: () {},
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
                          onPressed: (context) =>
                              details(context, compteRenduBloc),
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
                                              compteRenduBloc.datNai)
                                          .year >
                                  3
                              ? DateTime.now().year -
                                          DateTime.fromMillisecondsSinceEpoch(
                                                  compteRenduBloc.datNai)
                                              .year >
                                      60
                                  ? compteRenduBloc.sex
                                      ? const CircleAvatar(
                                          radius: 30.0,
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
                                  : compteRenduBloc.sex
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
                          compteRenduBloc.patient.toString(),
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
                                            compteRenduBloc.date)
                                        .toString()
                                        .split(" ")
                                        .first +
                                    " à " +
                                    DateTime.fromMillisecondsSinceEpoch(
                                            compteRenduBloc.heure)
                                        .toString()
                                        .split(" ")
                                        .last
                                        .replaceAll(":00.000", ""),
                              ),
                              Text(
                                "EXAMEN : " +
                                    compteRenduBloc.designation.toString(),
                              ),
                              Text(
                                "Med Trt: " +
                                    compteRenduBloc.medecinDictee.toString(),
                              ),
                              Text(
                                "Attente:" +
                                    compteRenduBloc.dureeAttente.toString(),
                              ),
                            ]),
                        trailing:
                            Row(mainAxisSize: MainAxisSize.min, children: [
                          if (compteRenduBloc.etat == "enAttente") ...[
                            const Icon(
                              Icons.alarm_on_rounded,
                              color: Colors.blue,
                              size: 30.0,
                            ),
                          ],
                          if (compteRenduBloc.etat == "dictee") ...[
                            const Icon(
                              Icons.mic,
                              color: Colors.blue,
                              size: 30.0,
                            ),
                          ],
                          if (compteRenduBloc.enSalle == true) ...[
                            const Icon(
                              Icons.door_back_door,
                              color: Colors.blue,
                              size: 30.0,
                            ),
                          ],
                          if (compteRenduBloc.etat == "valide") ...[
                            const Icon(
                              Icons.verified,
                              color: Colors.greenAccent,
                              size: 30.0,
                            ),
                          ],
                          if (compteRenduBloc.livre == true) ...[
                            const Icon(
                              Icons.done_all,
                              color: Colors.greenAccent,
                              size: 36.0,
                            ),
                          ],
                          if (compteRenduBloc.etat == "ecrit") ...[
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
void details(BuildContext context, CompteRenduBloc compteRenduBloc) {
  ServiceUser.configuration.numDoss = compteRenduBloc.nDossier;
  ServiceUser.configuration.heure = compteRenduBloc.heure;

  ServiceUser.configuration.patient = compteRenduBloc.patient;
  ServiceUser.configuration.sex = compteRenduBloc.sex;
  ServiceUser.configuration.Datenai = compteRenduBloc.datNai;
  ServiceUser.configuration.identifiant = compteRenduBloc.identifiant;
  ServiceUser.configuration.NomCentre = compteRenduBloc.centre;
  ServiceUser.configuration.Exa = compteRenduBloc.designation;
  ServiceUser.configuration.date = compteRenduBloc.dateExecution;
  ServiceUser.configuration.etat = compteRenduBloc.etat;
  ServiceUser.configuration.dateArrive = compteRenduBloc.date;
  ServiceUser.configuration.dureeEnSalle = compteRenduBloc.dureeensalle;
  ServiceUser.configuration.dureeAttente = compteRenduBloc.dureeAttente;
  Get.toNamed(Routes.DETAILS_COMPTE_RENDU);
}
