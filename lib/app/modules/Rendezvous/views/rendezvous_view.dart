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

  @override
  Widget build(BuildContext context) {
    print("**********************************");
    print(rendezvousController.listSalle);
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
        body: AgendaView(
          // the default view is timeItemHeight = 80 the timeline will be shown in 30 min view
          // and if you  setState it 160 it will be the 15 min view
          // or you can set it 60 and show an hourly timeline
          agendaStyle: const AgendaStyle(
            startHour: 9,
            endHour: 20,
            pillarSeperator: false,
            visibleTimeBorder: true,
            timeItemWidth: 40,
            timeItemHeight: 160,
          ),
          pillarList: rendezvousController.resources.value,
          // the click else where (other than an event because it has it's own onTap parameter)
          // you get the object linked to the head object of the pillar which could be you project costume object
          // and the cliked time
          onLongPress: (clickedTime, object) {
            print("Clicked time: ${clickedTime.hour}:${clickedTime.minute}");
            print("Head Object related to the resource: $object");
          },
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
