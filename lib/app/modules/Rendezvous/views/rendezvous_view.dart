import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radiologiev2/app/data/models/RendezVousModel.dart';
import 'package:radiologiev2/app/data/widgets/NavugationDrawer.dart';
import 'package:radiologiev2/app/data/widgets/RDVForm.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

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
                    hintStyle: const TextStyle(color: Colors.white),
                    prefixIcon: const Icon(Icons.business),
                    hintText: "Tous Les Centres ",
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: SizedBox(
                      width: 600,
                      child: SafeArea(
                        child: TextField(
                          readOnly: true,
                          controller: dateController,
                          decoration: InputDecoration(
                            hintText: "Pick Date",
                            contentPadding: const EdgeInsets.all(5),
                            prefixIcon:
                                const Icon(Icons.calendar_today_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onTap: () async {
                            var date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100));
                            dateController.text =
                                date.toString().substring(0, 10);
                          },
                        ),
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Table(border: TableBorder.all(), children: [
                  TableRow(
                    decoration: BoxDecoration(color: Colors.grey[200]),
                  ),
                  TableRow(children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: SfCalendar(
                        view: CalendarView.week,
                        headerHeight: 0,
                        viewHeaderHeight: 0,
                        selectionDecoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.red, width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ),
                    Column(children: <Widget>[
                      SizedBox(
                        child: Obx(
                          () => DropdownSearch<String>(
                            mode: Mode.BOTTOM_SHEET,
                            showSearchBox: true,
                            items: rendezvousController.listSalle
                                .map((element) => defaultLocale == "ar"
                                    ? element.designation.toString()
                                    : element.designation!.toString())
                                .toList(),
                            onChanged: (value) => {
                              rdv.Salle = value!,
                              print(value),
                              rendezvousController.listSalle.value
                                  .forEach((element) {
                                if (element.designation == value) {
                                  rendezvousController.Lsalle.value = element;
                                }
                              }),
                            },
                            selectedItem:
                                rendezvousController.Lsalle.value.designation,
                            dropdownSearchDecoration: InputDecoration(
                              hintText: "Salle",
                              contentPadding: const EdgeInsets.all(5),
                              prefixIcon: const Icon(Icons.forward_rounded),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                        ),
                      )
                    ])
                  ])
                ]),
              ),
            )
          ],
        ));
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
              decoration: InputDecoration(hintText: "Type here "),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('OK'),
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
