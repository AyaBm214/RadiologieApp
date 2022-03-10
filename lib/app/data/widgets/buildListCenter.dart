import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:radiologiev2/app/data/Controllers/CenterController.dart';
import 'package:radiologiev2/app/data/Services/ServiceCenter.dart';
import 'package:radiologiev2/app/data/models/CenterModel.dart';

late Future<List<Centerv>> futureCenter;
CenterController controller = Get.put(CenterController());

ServiceCenter sc = ServiceCenter();
late List<Centerv> cv;
Widget buildlistCenter() {
  futureCenter = sc.fetchCenter();
  return FutureBuilder<List<Centerv>>(
      future: futureCenter,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
              height: 300.0, // Change as per your requirement
              width: 300.0, // Change as per your requirement
              child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      trailing: const Icon(Icons.login_rounded),
                      title: Text(
                        snapshot.data![index].designCentre!,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      });
}
