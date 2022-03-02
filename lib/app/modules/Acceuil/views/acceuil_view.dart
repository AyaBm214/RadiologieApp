import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radiologiev2/app/modules/Acceuil/controllers/acceuil_controller.dart';
import 'package:radiologiev2/app/modules/Acceuil/views/CenterModel.dart';
import 'package:radiologiev2/models/Services/ServiceCenter.dart';
import '../controllers/acceuil_controller.dart';
import 'NavugationDrawer.dart';
import 'SearchPage.dart';

class AcceuilView extends GetView<AcceuilController> {
  final dateController = TextEditingController();
  final dateController2 = TextEditingController();

  late Future<List<Centerv>> futureCenter;
  AcceuilController controller = Get.put(AcceuilController());

  ServiceCenter sc =  ServiceCenter();
  late List<Centerv> cv ;

  AcceuilView({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  NavigationDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: InkWell(
            onTap: () {
              Get.defaultDialog(
                title: ('TOUS LES CENTRES'),
                content: buildlist() ,
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
                    child: Icon(Icons.business, size: 25),
                  ),
                ],
              ),
            )
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const SearchPage())),
              icon: const Icon(Icons.search),
              color: Colors.white,
            iconSize: 36,
          )
                 ],
            ),
        body:
            Row(
          children: [
             SizedBox(
               width: 120,
        child: SafeArea(
              child: TextField(
                 readOnly: true,
                 controller: dateController,
                 decoration: InputDecoration(
                   hintText: 'Pick your Date',
                   contentPadding:  const EdgeInsets.all(5),
                   prefixIcon: const Icon(Icons.calendar_today_outlined),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(20.0),
                   ),
                 ),
                 onTap: () async {
                   var date =  await showDatePicker(
                       context: context,
                       initialDate:DateTime.now(),
                       firstDate:DateTime(1900),
                       lastDate: DateTime(2100));
                   dateController.text = date.toString().substring(0,10);
                 },),
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
                    contentPadding:  const EdgeInsets.all(5),
                    prefixIcon: const Icon(Icons.calendar_today_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onTap: () async {
                    var date =  await showDatePicker(
                        context: context,
                        initialDate:DateTime.now(),
                        firstDate:DateTime(1900),
                        lastDate: DateTime(2100));
                    dateController2.text = date.toString().substring(0,10);
                  },),
              )),
                SizedBox(
                 width: 120,
                  child: SafeArea(
                    child:IconButton(
                  icon: const Icon(Icons.filter_alt_rounded),
                      color: Colors.red,
                      padding: const EdgeInsets.only(right: 1, top:10),
                     highlightColor: Colors.white,
                    iconSize: 35,
                       onPressed: () {}
                        ),
                           ),),
                         ],
                        ),
                          );
                               }
  Widget buildlist() {
    futureCenter = sc.fetchCenter();
    return
      FutureBuilder<List<Centerv>>(
          future: futureCenter,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SizedBox(
                  height: 300.0, // Change as per your requirement
                  width: 300.0, // Change as per your requirement
                  child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder : (BuildContext context, int index) {
                  return ListTile(
                      trailing: const Icon(Icons.login_rounded),
                      title:
                      Text(
                        snapshot.data![index].designCentre!,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  );
                }
              ));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }
      );

  }
}






