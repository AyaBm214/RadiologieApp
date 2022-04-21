import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radiologiev2/app/data/models/CompteRmodel.dart';
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
                        rendezvousController.listCenter.value
                            .forEach((element) {
                          if (element.designCentre == value) {
                            rendezvousController.Lcenterv.value = element;
                          }
                        }),
                      },
                  selectedItem:
                      rendezvousController.Lcenterv.value.designCentre,
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
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(
                  width: 120,
                  child: SafeArea(
                    child: TextField(
                      readOnly: true,
                      controller: datearrivee,
                      decoration: InputDecoration(
                        hintText: 'Pick your Date',
                        contentPadding: const EdgeInsets.all(5),
                        prefixIcon: const Icon(Icons.calendar_today_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onTap: () async {
                        var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));
                        datearrivee.text = date.toString().substring(0, 10);
                      },
                    ),
                  )),
              SizedBox(
                  width: 120,
                  child: SafeArea(
                    child: TextField(
                      textAlign: TextAlign.center,
                      readOnly: true,
                      controller: datesortie,
                      decoration: InputDecoration(
                        hintText: 'Pick your Date',
                        contentPadding: const EdgeInsets.all(5),
                        prefixIcon: const Icon(Icons.calendar_today_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onTap: () async {
                        var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));
                        datesortie.text = date.toString().substring(0, 10);
                      },
                    ),
                  )),
            ]),
          ),
        ));
  }

  showEtatDialog(BuildContext context) {
    // set up the list options
    Widget optionOne = SimpleDialogOption(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const <Widget>[
          Icon(
            Icons.border_all,
            color: Colors.blue,
            size: 36.0,
          ),
          Text(
            "Tous",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
      onPressed: () {
        print("Tous");
        Navigator.of(context).pop();
      },
    );
    Divider();
    Widget optionTwo = SimpleDialogOption(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const <Widget>[
          Icon(
            Icons.alarm_on_rounded,
            color: Colors.blue,
            size: 36.0,
          ),
          Text(
            "En Attente",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
      onPressed: () {
        print("En Attente");
        Navigator.of(context).pop();
      },
    );
    Divider();
    Widget optionThree = SimpleDialogOption(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const <Widget>[
          Icon(
            Icons.door_back_door,
            color: Colors.blue,
            size: 36.0,
          ),
          Text(
            "En Salle",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
      onPressed: () {
        print("En Salle");
        Navigator.of(context).pop();
      },
    );
    Divider();

    Widget optionFour = SimpleDialogOption(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const <Widget>[
          Icon(
            Icons.login_outlined,
            color: Colors.blue,
            size: 36.0,
          ),
          Text(
            "Terminé",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
      onPressed: () {
        print("Terminé");
        Navigator.of(context).pop();
      },
    );
    Divider();

    Widget optionFive = SimpleDialogOption(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const <Widget>[
          Icon(
            Icons.mic,
            color: Colors.blue,
            size: 36.0,
          ),
          Text(
            "Dicté",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
      onPressed: () {
        print("Dicté");
        Navigator.of(context).pop();
      },
    );
    Divider();

    Widget optionSix = SimpleDialogOption(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const <Widget>[
          Icon(
            Icons.edit,
            color: Colors.greenAccent,
            size: 36.0,
          ),
          Text(
            "Ecrit",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
      onPressed: () {
        print("Ecrit");
        Navigator.of(context).pop();
      },
    );
    Divider();

    Widget optionSeven = SimpleDialogOption(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const <Widget>[
          Icon(
            Icons.verified_rounded,
            color: Colors.greenAccent,
            size: 36.0,
          ),
          Text(
            "Validé",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
      onPressed: () {
        print("Validé");
        Navigator.of(context).pop();
      },
    );
    Divider();

    Widget optionEight = SimpleDialogOption(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const <Widget>[
          Icon(
            Icons.done_all,
            color: Colors.greenAccent,
            size: 36.0,
          ),
          Text(
            "Livré",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
      onPressed: () {
        print("Livré");
        Navigator.of(context).pop();
      },
    );

    // set up the SimpleDialog
    SimpleDialog dialog = SimpleDialog(
      children: <Widget>[
        optionOne,
        optionTwo,
        optionThree,
        optionFour,
        optionFive,
        optionSix,
        optionSeven,
        optionEight,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }
}
