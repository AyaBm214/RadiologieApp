import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:radiologiev2/app/data/models/CompteRmodel.dart';
import 'package:radiologiev2/app/modules/ListComptesRendus/controllers/list_comptes_rendus_controller.dart';

ListComptesRendusController CompteController =
    Get.put(ListComptesRendusController());

Widget buildListCompteRendu() {
  return Obx(() => ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: CompteController.Patienttrouve.length,
      itemBuilder: (BuildContext context, int index) {
        CompteRendu compte = CompteController.Patienttrouve[index];
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
                      motion: const ScrollMotion(),

                      // A pane can dismiss the Slidable.
                      dismissible: DismissiblePane(onDismissed: () {}),

                      // All actions are defined in the children parameter.
                      children: const [
                        // A SlidableAction can have an icon and/or a label.
                        SlidableAction(
                          onPressed: doNothing,
                          backgroundColor: Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Détails',
                        ),
                        SlidableAction(
                          onPressed: doNothing,
                          backgroundColor: Color(0xFF21B7CA),
                          foregroundColor: Colors.white,
                          icon: Icons.share,
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
                          icon: Icons.archive,
                          label: 'Archive',
                        ),
                        SlidableAction(
                          onPressed: doNothing,
                          backgroundColor: Color(0xFF0392CF),
                          foregroundColor: Colors.white,
                          icon: Icons.save,
                          label: 'Save',
                        ),
                      ],
                    ),
                    child: ListTile(
                        leading: Row(mainAxisSize: MainAxisSize.min, children: [
                          if (compte.sex == true) ...[
                            const CircleAvatar(
                              radius: 50.0,
                              backgroundImage: NetworkImage(
                                  "https://cdn5.vectorstock.com/i/1000x1000/58/49/man-character-avatar-in-flat-design-vector-12015849.jpg"),
                              backgroundColor: Colors.transparent,
                            ),
                          ],
                          if (compte.sex == false) ...[
                            const CircleAvatar(
                              radius: 50.0,
                              backgroundImage: NetworkImage(
                                  "https://cdn3.vectorstock.com/i/1000x1000/01/77/businesswoman-character-avatar-icon-vector-12800177.jpg"),
                              backgroundColor: Colors.transparent,
                            ),
                          ]
                        ]),
                        title: Text(
                          compte.patient!.toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 15.0),
                        ),
                        subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "RDV:" + compte.dateExecution.toString(),
                              ),
                              Text(
                                "EXAMEN : " + compte.designation.toString(),
                              ),
                              Text(
                                "Med Trt: " + compte.medecinDictee.toString(),
                              ),
                              Text(
                                "Attente:" + compte.dureeAttente.toString(),
                              ),
                            ]),
                        trailing:
                            Row(mainAxisSize: MainAxisSize.min, children: [
                          if (compte.etat == "enAttente") ...[
                            Icon(
                              Icons.alarm_on_rounded,
                              color: Colors.blue,
                              size: 30.0,
                            ),
                          ],
                          if (compte.etat == "dictee") ...[
                            Icon(
                              Icons.mic,
                              color: Colors.blue,
                              size: 30.0,
                            ),
                          ],
                          if (compte.enSalle == true) ...[
                            Icon(
                              Icons.door_back_door,
                              color: Colors.blue,
                              size: 30.0,
                            ),
                          ],
                          if (compte.etat == "valide") ...[
                            Icon(
                              Icons.verified,
                              color: Colors.greenAccent,
                              size: 30.0,
                            ),
                          ],
                          if (compte.livre == true) ...[
                            Icon(
                              Icons.done_all,
                              color: Colors.greenAccent,
                              size: 36.0,
                            ),
                          ],
                          if (compte.etat == "ecrit") ...[
                            Icon(
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
