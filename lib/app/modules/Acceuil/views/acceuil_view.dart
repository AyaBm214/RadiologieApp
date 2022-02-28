import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:radiologiev2/app/modules/Acceuil/controllers/acceuil_controller.dart';

import 'package:radiologiev2/app/routes/app_pages.dart';
import '../controllers/acceuil_controller.dart';
import 'Center_items.dart';

class AcceuilView extends GetView<AcceuilController> {
  final dateController = TextEditingController();
  final dateController2 = TextEditingController();

   AcceuilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: InkWell(
            onTap: () {
              Get.defaultDialog(
                title: ('TOUS LES CENTRES'),
                content: GetBuilder<AcceuilController>(
                  builder: (controller) {
                    return SizedBox(
                      height: 300.0,
                      width: 300.0,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.CentervList.length,
                        itemBuilder: (context, index) =>
                            CentersListItem(
                              Center: controller.CentervList[index],
                              Key: const {},
                            ),
                      ),
                    );
                  },
                ),
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
      ),
        body:  Row(
            mainAxisAlignment : MainAxisAlignment.spaceBetween,
            children: [
             SizedBox(
               width: 180,
        child: Expanded(
              child: TextField(
                 readOnly: true,
                 controller: dateController,
                 decoration: InputDecoration(
                   hintText: 'Pick your Date',
                   contentPadding:  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                   prefixIcon: Icon(Icons.calendar_today_outlined),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(32.0),
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
                width: 180,
              child: Expanded(
                child: TextField(
                  readOnly: true,
                  controller: dateController2,
                  decoration: InputDecoration(
                    hintText: 'Pick your Date',
                    contentPadding:  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    prefixIcon: Icon(Icons.calendar_today_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
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
            ],
          ),

    );
  }
}
  class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  get myController => myController.dispose();

    @override
    Widget build(BuildContext context) {
    return Drawer(
    child: ListView(
    children: [
    buildDrawerHeader(),
    buildDrawerItem(
    icon: Icons.grading_outlined,
    text: "Radio",
    onTap: () => navigate(0),
    tileColor: Get.currentRoute == Routes.RADIO ? Colors.blue : null,
    textIconColor: Get.currentRoute == Routes.RADIO
    ? Colors.white
        : Colors.black,
    ),
      const Divider(
        color: Colors.black38,
      ),
    buildDrawerItem(
    icon: Icons.calendar_today_outlined,
    text: "Rendez vous",
    onTap: () => navigate(1),
    tileColor: Get.currentRoute == Routes.RENDEZVOUS ? Colors.lightGreen : null,
    textIconColor: Get.currentRoute == Routes.RENDEZVOUS
    ? Colors.white
        : Colors.black,
    ),
      const Divider(
        color: Colors.black38,
      ),
    buildDrawerItem(
    icon: Icons.logout,
      text: "Deconnexion",
    onTap: () => navigate(2),
    tileColor: Get.currentRoute == Routes.HOME ? Colors.blue : null,
    textIconColor: Get.currentRoute == Routes.HOME
    ? Colors.white
        : Colors.black),

      const Divider(
        color: Colors.black38,
      ),
    ],
    ),
    );
    }

    Widget buildDrawerHeader() {
    return  DrawerHeader(
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blueAccent,
              Colors.yellowAccent,
            ],
          ),
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height:
                  constraints.maxHeight / 8, // half white on drawer
                    // change the colors you want
                    color:Colors.white60,

                ),
              ),
              Align(
                alignment: const Alignment(-.85, 0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white60,
                      shape: BoxShape.circle,
                      border: Border.all(
                        // you can also provide height/width of container with without using border while both are using same color
                        width: 10,
                        color: Colors.white12,
                      ) //white radius around image
                  ),
                  child: Icon(
                    Icons.person,
                    size: constraints.maxHeight / 2,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment(.3, -.2),
                child: Text( 'User'  ,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop(); //close the drawer
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    )),
              )
            ],
          );
        }));
    }
    }

    Widget buildDrawerItem({
    required String text,
    required IconData icon,
    required Color textIconColor,
    required Color? tileColor,
    required VoidCallback onTap,
    }) {
    return ListTile(
    leading: Icon(icon, color: textIconColor),
    title: Text(
    text,
    style: TextStyle(color: textIconColor),
    ),
    tileColor: tileColor,
    onTap: onTap,
    );
    }

    navigate(int index) {
    if (index == 0) {
    Get.toNamed(Routes.RADIO);
    }
    else if (index == 1) {
    Get.toNamed(Routes.RENDEZVOUS);
    }
    if (index == 2) {
    Get.toNamed(Routes.HOME);
    }
    }





