import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_agenda/flutter_agenda.dart';
import 'package:get/get.dart';
import 'package:radiologiev2/app/data/models/RendezVousModel.dart';
import 'package:radiologiev2/app/data/widgets/NavugationDrawer.dart';
import 'package:radiologiev2/app/data/widgets/RDVForm.dart';

import '../controllers/rendezvous_controller.dart';

class RendezvousView extends GetView<RendezvousController> {
  final RendezvousController rendezvousController =
      Get.put(RendezvousController());
  String? defaultLocale;
  final dateController = TextEditingController();
  final RendezVous rdv = RendezVous();
  TextEditingController _textFieldController = TextEditingController();
  late String valueText;
  late String codeDialog;
  final RendezvousController SalleAgendaController =
      Get.put(RendezvousController());
  final datearrivee = TextEditingController();

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
                  onChanged: (value) async {
                    rendezvousController.Lcenterv.value = rendezvousController
                        .listCenter.value
                        .firstWhere((element) =>
                            element.designCentre!.compareTo(value!) == 0);
                    rendezvousController.listSalle.clear();
                    await rendezvousController.fetchSallesByCeentre(
                        rendezvousController.Lcenterv.value.codeCentre!);
                    await rendezvousController.fetchRendezVous(
                        rendezvousController.date.value.millisecondsSinceEpoch);
                    rendezvousController.sallesCalendar.clear();
                    await rendezvousController.fetchEvents();
                  },
                  selectedItem:
                      rendezvousController.Lcenterv.value.designCentre,
                  dropdownSearchDecoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8),
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
                _displayTextInputDialog(context);
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormulaireView(),
                ));
          },
          child: const Icon(Icons.add),
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              readOnly: true,
              controller: datearrivee,
              decoration: InputDecoration(
                hintText: rendezvousController.date.value.year.toString() +
                    "-" +
                    rendezvousController.date.value.month.toString() +
                    "-" +
                    rendezvousController.date.value.day.toString(),
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
                    firstDate: DateTime(2022),
                    lastDate: DateTime(2090));
                datearrivee.text = date.toString().substring(0, 10);
                rendezvousController.date.value = date!;
                await rendezvousController.fetchRendezVous(
                    rendezvousController.date.value.millisecondsSinceEpoch);
                rendezvousController.sallesCalendar.clear();
                await rendezvousController.fetchEvents();
                // rendezvousCont
              },
            ),
          ),
          Expanded(
            child: Obx(() => AgendaView(
                  agendaStyle: const AgendaStyle(
                    pillarHeadWidth: 200,
                    pillarHeadHeight: 60,
                    startHour: 7,
                    endHour: 22,
                    pillarSeperator: false,
                    visibleTimeBorder: true,
                    timeItemWidth: 50,
                    timeItemHeight: 160,
                  ),
                  pillarList: rendezvousController.sallesCalendar.value,
                )),
          )
        ]));
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Choisir Medecin P'),
            content: TextField(
              onChanged: (value) {
                valueText = value;
                print(value);
              },
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: "Type here "),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: const Text('OK'),
                onPressed: () {
                  codeDialog = valueText;
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
