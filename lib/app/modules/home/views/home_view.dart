import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radiologiev2/app/data/webService.dart';
import 'package:radiologiev2/app/modules/login/views/login_view.dart';
import 'package:radiologiev2/models/CliniqueModel.dart';
import '../controllers/home_controller.dart';
// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  @override
  HomeController controller = Get.put(HomeController());
  final WebService cliniqueWebServices = WebService();
  late List<clinique> listClinique ;
  bool isSearching= false;

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: ()=>controller.fetchClinique(),
          child: const Icon(Icons.refresh_rounded, color: Colors.blue, size: 20.0,),
        ),
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Obx(
              ()=>!controller.isSearching.value
              ?
          Image.asset('assets/images/logo.png',width: 200,height: 500,)
              :
          TextField(
            onChanged: (value) => controller.searchClinique(value),
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
              icon: Icon(
                Icons.search,
                color: Color.fromRGBO(0, 147, 189,0.9), size: 30.0,
              ),
              hintText: "Chercher ton clinique",
              hintStyle: TextStyle(color: Color.fromRGBO(0, 147, 189,0.9)),
            ),
          ),),
        centerTitle: true,
        actions: [
          Obx(
                ()=>!controller.isSearching.value
                ?
            IconButton(
                icon: const Icon(Icons.search,
                  color:Color.fromRGBO(0, 147, 189,0.9),
                  size: 25.0,),
                onPressed:(){
                  controller.changeStatus(true);

                })

                :
            IconButton(
              icon: const Icon(Icons.cancel ,color: Color.fromRGBO(0, 147, 189,0.9), size: 30.0,),
              onPressed: () {
                controller.changeStatus(false);
                controller.Cliniquetrouve.value= controller.listcliniques;
              },
            )
            ,
          ),
        ],
      ),

    body: SingleChildScrollView(
        child:
              FutureBuilder(
                  future: controller.fetchClinique(),
                  builder: (BuildContext context,  snapshot) {
                    if (snapshot.hasError) {
                      print(snapshot.error);
                      return const Center(
                        child: Text("Impossible de récupere la liste des cliniques " ,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(0, 147, 189,0.9),
                          ),
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return buildList();
                    } else {
                      return const Center(
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  }
              )
      ),
    );
  }
  Widget buildList() {
    return Obx(
            () => ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: controller.Cliniquetrouve.length,
        itemBuilder: (BuildContext context, int index){
          // ignore: unused_local_variable
          clinique cliniques = controller.Cliniquetrouve[index];
          return Card(
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    controller.configuration.NomCliniqueset=cliniques.nom!;
                    Get.to(LoginView());
                  },
            leading: const Icon(Icons.local_hospital ,color: Color.fromRGBO(0, 147, 189,0.9),),
            title: Center(child: Text(cliniques.nom.toString(), style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 19.0),

                ),
            ),
                )],
            ),
          );
        }));
  }
}

