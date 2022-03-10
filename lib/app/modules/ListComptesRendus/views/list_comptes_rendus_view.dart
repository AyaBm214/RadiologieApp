import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radiologiev2/app/data/widgets/buildListCenter.dart';
import 'package:radiologiev2/app/modules/ListComptesRendus/controllers/list_comptes_rendus_controller.dart';

import '../../../data/widgets/NavugationDrawer.dart';

class ListComptesRendusView extends GetView<ListComptesRendusController> {
  final dateController = TextEditingController();
  final dateController2 = TextEditingController();

  ListComptesRendusView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: InkWell(
            onTap: () {
              Get.defaultDialog(
                title: ('TOUS LES CENTRES'),
                content: buildlistCenter(),
              );
            },
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Tous les Centres ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  WidgetSpan(
                    child:
                        Icon(Icons.arrow_drop_down_circle_outlined, size: 15),
                  ),
                ],
              ),
            )),
        // actions: [
        //   IconButton(
        //     onPressed: () => Navigator.of(context)
        //         .push(MaterialPageRoute(builder: (_) => const SearchPage())),
        //     icon: const Icon(Icons.search),
        //     color: Colors.white,
        //     iconSize: 36,
        //   )
        // ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
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
          SizedBox(
            width: 120,
            child: SafeArea(
              child: IconButton(
                  icon: const Icon(Icons.filter_alt_rounded),
                  color: Colors.red,
                  padding: const EdgeInsets.only(right: 1, top: 10),
                  highlightColor: Colors.white,
                  iconSize: 35,
                  onPressed: () {}),
            ),
          ),
        ]),
      ),
    );
  }
}
