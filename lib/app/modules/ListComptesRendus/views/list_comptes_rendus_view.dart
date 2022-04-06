import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radiologiev2/app/modules/ListComptesRendus/controllers/list_comptes_rendus_controller.dart';
import 'package:radiologiev2/app/modules/Rendezvous/controllers/rendezvous_controller.dart';

import '../../../data/widgets/NavugationDrawer.dart';

class ListComptesRendusView extends GetView<ListComptesRendusController> {
  final dateController = TextEditingController();
  final dateController2 = TextEditingController();
  final RendezvousController rendezvousController =
      Get.put(RendezvousController());
  String? defaultLocale;

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
              onPressed: () {},
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
                      controller: dateController,
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
                        dateController.text = date.toString().substring(0, 10);
                      },
                    ),
                  )),
              SizedBox(
                  width: 120,
                  child: SafeArea(
                    child: TextField(
                      textAlign: TextAlign.center,
                      readOnly: true,
                      controller: dateController2,
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
                        dateController2.text = date.toString().substring(0, 10);
                      },
                    ),
                  )),
            ]),
          ),
        ));
  }
}
