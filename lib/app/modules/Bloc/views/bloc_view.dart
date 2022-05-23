import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radiologiev2/app/data/models/CompteRenduBlocModel.dart';
import 'package:radiologiev2/app/data/widgets/EtatWidget.dart';
import 'package:radiologiev2/app/data/widgets/ListCRBloc.dart';
import 'package:radiologiev2/app/data/widgets/NavugationDrawer.dart';

import '../controllers/bloc_controller.dart';

class BlocView extends GetView<BlocController> {
  final datearrivee = TextEditingController();
  final datesortie = TextEditingController();

  String? defaultLocale;
  BlocController CompteBlocController = Get.put(BlocController());
  bool isSearching = false;
  late List<CompteRenduBloc> listCompteBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: SizedBox(
          child: Obx(
            () => !CompteBlocController.isSearching.value
                ? DropdownSearch<String>(
                    mode: Mode.BOTTOM_SHEET,
                    showSearchBox: true,
                    items: CompteBlocController.listCenter
                        .map((element) => defaultLocale == "ar"
                            ? element.designCentre.toString()
                            : element.designCentre!.toString())
                        .toList(),
                    onChanged: (value) => {
                          CompteBlocController.listCenter.value
                              .forEach((element) {
                            if (element.designCentre == value) {
                              CompteBlocController.LcentervCR.value = element;
                              print(CompteBlocController
                                  .LcentervCR.value.codeCentre);
                            }
                          }),
                        },
                    selectedItem:
                        CompteBlocController.LcentervCR.value.designCentre,
                    dropdownSearchDecoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(8),
                      hintText: "Tous Les Centres",
                      hintStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(Icons.business),
                      labelStyle: TextStyle(
                        color: Get.theme.primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ))
                : TextField(
                    onChanged: (value) =>
                        CompteBlocController.searchPatient(value),
                    style: const TextStyle(color: Colors.black),
                    autofocus: true,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      hintText: "Chercher Patient",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
          ),
        ),
        centerTitle: true,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(
                () => !CompteBlocController.isSearching.value
                    ? IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 25.0,
                        ),
                        onPressed: () {
                          CompteBlocController.changeStatus(true);
                        })
                    : IconButton(
                        icon: const Icon(
                          Icons.cancel,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        onPressed: () {
                          CompteBlocController.changeStatus(false);
                          CompteBlocController.Patienttrouve.value =
                              CompteBlocController.listCompteBloc;
                        },
                      ),
              ),
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
                  future: CompteBlocController.fetchCompteRenduBloc(),
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
                      return buildListCompteRenduBloc();
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
