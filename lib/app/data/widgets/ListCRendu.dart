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
bool male = true;
bool female = false;

Widget buildListCompteRendu() {
  return Obx(() => ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: CompteController.listCompte.length,
      itemBuilder: (BuildContext context, int index) {
        CompteRendu compte = CompteController.listCompte[index];

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
                      leading: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage(
                            "https://cdn5.vectorstock.com/i/1000x1000/58/49/man-character-avatar-in-flat-design-vector-12015849.jpg"),
                        backgroundColor: Colors.transparent,
                      ),
                      title: Text(
                        compte.patient!.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 19.0),
                      ),
                      subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              compte.dateExecution.toString(),
                            ),
                            Text(
                              compte.designation.toString(),
                            ),
                            Text(
                              compte.medecinDictee.toString(),
                            ),
                            Text(
                              compte.dureeAttente.toString(),
                            ),
                          ]),
                      trailing: Icon(
                        Icons.done_all,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }));
}

void doNothing(BuildContext context) {}
