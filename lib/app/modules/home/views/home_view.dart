import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radiologiev2/app/data/Services/ServiceUser.dart';
import 'package:radiologiev2/app/data/Services/webService.dart';
import 'package:radiologiev2/app/data/models/CliniqueModel.dart';
import 'package:radiologiev2/app/modules/login/views/login_view.dart';

import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  @override
  HomeController homeController = Get.put(HomeController());
  final WebService cliniqueWebServices = WebService();
  late List<Clinique> listClinique;

  bool isSearching = false;

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => homeController.fetchClinique(),
          child: const Icon(
            Icons.refresh_rounded,
            color: Colors.blue,
            size: 20.0,
          ),
        ),
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Obx(
          () => !homeController.isSearching.value
              ? Image.asset(
                  'assets/images/logo.png',
                  width: 200,
                  height: 500,
                )
              : TextField(
                  onChanged: (value) => homeController.searchClinique(value),
                  style: const TextStyle(color: Colors.black),
                  autofocus: true,
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Color.fromRGBO(0, 147, 189, 0.9),
                      size: 30.0,
                    ),
                    hintText: "Chercher ton clinique",
                    hintStyle:
                        TextStyle(color: Color.fromRGBO(0, 147, 189, 0.9)),
                  ),
                ),
        ),
        centerTitle: true,
        actions: [
          Obx(
            () => !homeController.isSearching.value
                ? IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Color.fromRGBO(0, 147, 189, 0.9),
                      size: 25.0,
                    ),
                    onPressed: () {
                      homeController.changeStatus(true);
                    })
                : IconButton(
                    icon: const Icon(
                      Icons.cancel,
                      color: Color.fromRGBO(0, 147, 189, 0.9),
                      size: 30.0,
                    ),
                    onPressed: () {
                      homeController.changeStatus(false);
                      homeController.Cliniquetrouve.value =
                          homeController.listcliniques;
                    },
                  ),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: FutureBuilder(
              future: homeController.fetchClinique(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return const Center(
                    child: Text(
                      "Impossible de récupere la liste des cliniques ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 147, 189, 0.9),
                      ),
                    ),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return buildList();
                } else {
                  return const Center(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              })),
    );
  }

  Widget buildList() {
    return Obx(() => ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: homeController.Cliniquetrouve.length,
        itemBuilder: (BuildContext context, int index) {
          Clinique cliniques = homeController.Cliniquetrouve[index];
          return Card(
            child: InkWell(
              onTap: () {
                homeController.configuration.NomCliniqueset = cliniques.nom!;
                homeController.configuration.url = cliniques.url!;
                ServiceUser.configuration.NomClinique = cliniques.nom!;
                ServiceUser.configuration.url = cliniques.url!;
                ServiceUser.configuration.username = "";
                Get.offAll(LoginView());
              },
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.local_hospital,
                      color: Color.fromRGBO(0, 147, 189, 0.9),
                    ),
                    title: Center(
                      child: Text(
                        cliniques.nom.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 19.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
