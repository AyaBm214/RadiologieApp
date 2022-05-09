import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radiologiev2/app/data/widgets/EtatWidget.dart';
import 'package:radiologiev2/app/data/widgets/ListCRendu.dart';
import 'package:radiologiev2/app/modules/ListComptesRendus/controllers/list_comptes_rendus_controller.dart';
import 'package:radiologiev2/app/modules/Rendezvous/controllers/rendezvous_controller.dart';

import '../../../data/widgets/NavugationDrawer.dart';

class ListComptesRendusView extends GetView<ListComptesRendusController> {
  final datearrivee = TextEditingController();
  final datesortie = TextEditingController();
  final RendezvousController rendezvousController =
      Get.put(RendezvousController());
  String? defaultLocale;
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
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
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
              ],
            ),
          ),
          Expanded(
              child: FutureBuilder(
                  future: CompteController.fetchCompteRendu(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasError) {
                      print("snapshotError $snapshot.error");
                      return const Center(
                        child: Text(
                          "Impossible de récupere la liste",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(0, 147, 189, 0.9),
                          ),
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return buildListCompteRendu();
                    } else {
                      return const Center(
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  })),
        ],
      ),
    );
  }
}
