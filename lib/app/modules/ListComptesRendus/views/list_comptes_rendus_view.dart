import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:radiologiev2/app/data/models/CompteRmodel.dart';
import 'package:radiologiev2/app/data/widgets/EtatWidget.dart';
import 'package:radiologiev2/app/modules/ListComptesRendus/controllers/list_comptes_rendus_controller.dart';
import 'package:radiologiev2/app/modules/Rendezvous/controllers/rendezvous_controller.dart';

import '../../../data/widgets/NavugationDrawer.dart';

class ListComptesRendusView extends GetView<ListComptesRendusController> {
  final datearrivee = TextEditingController();
  final datesortie = TextEditingController();
  final RendezvousController rendezvousController =
      Get.put(RendezvousController());
  String? defaultLocale;
  late final CompteRendu compte;
  ListComptesRendusController CompteController =
      Get.put(ListComptesRendusController());

  ListComptesRendusView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: SizedBox(
          child: Obx(
            () => DropdownSearch<String>(
                mode: Mode.BOTTOM_SHEET,
                showSearchBox: true,
                items: rendezvousController.listCenter
                    .map((element) => defaultLocale == "ar"
                        ? element.designCentre.toString()
                        : element.designCentre!.toString())
                    .toList(),
                popupItemDisabled: (String s) => s.startsWith('I'),
                onChanged: (value) => {
                      rendezvousController.listCenter.value.forEach((element) {
                        if (element.designCentre == value) {
                          rendezvousController.Lcenterv.value = element;
                        }
                      }),
                    },
                selectedItem: rendezvousController.Lcenterv.value.designCentre,
                dropdownSearchDecoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8),
                  hintText: "Tous Les Centres",
                  hintStyle: const TextStyle(color: Colors.white),
                  prefixIcon: const Icon(Icons.business),
                  labelStyle: TextStyle(
                    color: Get.theme.primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                )),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.filter_alt_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              showEtatDialog(context);
            },
          )
        ],
      ),
      body: ListView(
        children: [
          Slidable(
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
                  label: 'Delete',
                ),
                SlidableAction(
                  onPressed: doNothing,
                  backgroundColor: Color(0xFF21B7CA),
                  foregroundColor: Colors.white,
                  icon: Icons.share,
                  label: 'Share',
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
            child: Card(
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(
                      "https://cdn5.vectorstock.com/i/1000x1000/58/49/man-character-avatar-in-flat-design-vector-12015849.jpg"),
                  backgroundColor: Colors.transparent,
                ),
                title: Text('Numéro du Dossier'),
                subtitle: Text('Détails'),
                trailing: Icon(
                  Icons.done_all,
                  color: Colors.greenAccent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void doNothing(BuildContext context) {}
