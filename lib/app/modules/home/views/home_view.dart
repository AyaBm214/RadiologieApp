import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:radiologiev2/app/data/webService.dart';
import 'package:radiologiev2/app/modules/home/views/search_widget.dart';
import 'package:radiologiev2/app/modules/login/views/login_view.dart';
import 'package:radiologiev2/models/CliniqueModel.dart';
import '../controllers/home_controller.dart';
// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  @override
  HomeController controller = Get.put(HomeController());
  final WebService cliniqueWebServices = WebService();
  late List<clinique> listClinique ;
  String query = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: ()=>controller.fetchClinique(),
          child: const Icon(Icons.refresh_rounded, color: Colors.blue, size: 30.0,),
        ),
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Image.asset('assets/images/logo.png',width: 200,height: 500,),
        centerTitle: true,
      ),

    body: SingleChildScrollView(
        child: SizedBox(
          height: double.maxFinite,
          child: Column(
            children: [
              buildSearch(),
              const Text("Liste des cliniques" ,
                style: TextStyle(
                  height: 1,
                  fontWeight: FontWeight.normal,
                  fontSize: 25,

                  color: Color.fromRGBO(0, 147, 189,0.9),

                ),
              ),
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
                      return buildList(controller.listcliniques);
                    } else {
                      return const Center(
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                  }
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget buildList(List<clinique> list) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index){
          // ignore: unused_local_variable
          clinique cliniques = list[index];
          return Card(
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    Get.to(LoginView(), arguments:cliniques.nom!);
                  },
            leading: const Icon(FontAwesomeIcons.hospital ,color: Color.fromRGBO(0, 147, 189,0.9),),
            title: Center(child: Text(cliniques.nom.toString(), style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 19.0),

                ),
            ),
                )],
            ),
          );
        });
  }
  Widget buildSearch() => SearchWidget(
    text: query,
    hintText: 'Title of clinique',
    onChanged: searchclinique,
  );

  void searchclinique(String query) {
    setState(() {
      this.query = query;
      listClinique = listClinique;
    });
  }
}
  void setState(Null Function() param0) {
  }

