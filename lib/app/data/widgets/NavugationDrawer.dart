import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radiologiev2/app/modules/Rendezvous/views/rendezvous_view.dart';
import 'package:radiologiev2/app/modules/home/controllers/home_controller.dart';
import 'package:radiologiev2/app/modules/home/views/home_view.dart';
import 'package:radiologiev2/app/modules/radio/views/radio_view.dart';

class NavigationDrawer extends StatelessWidget {
  get myController => myController.dispose();

  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Admin'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.blue
                  : Colors.white,
              child: Text(
                "A",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
            accountEmail: null,
          ),
          ListTile(
            trailing: const Icon(Icons.file_copy),
            title: const Text("Radio"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => RadioView()));
            },
          ),
          const Divider(
            color: Colors.black38,
          ),
          ListTile(
            trailing: const Icon(Icons.calendar_today_outlined),
            title: const Text("Rendez-vous"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => RendezvousView()));
            },
          ),
          const Divider(
            color: Colors.black38,
          ),
          ListTile(
            trailing: const Icon(Icons.login),
            title: const Text("Deconnexion"),
            onTap: () {
              Navigator.of(context).pop();

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => HomeView()));
            },
          ),
          const Divider(
            color: Colors.black38,
          ),
        ],
      ),
    );
  }
}
