import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radiologiev2/app/data/Services/ServiceUser.dart';
import 'package:radiologiev2/app/modules/Bloc/views/bloc_view.dart';
import 'package:radiologiev2/app/modules/Exploitation/views/exploitation_view.dart';
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
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.blue
                  : Colors.white,
              child: RichText(
                text: TextSpan(
                  text: ServiceUser.username,
                  style: const TextStyle(
                      color: Color.fromRGBO(4, 116, 124, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            accountEmail: null,
            accountName: Text(
              ServiceUser.configuration.NomClinique,
              style: TextStyle(),
            ),
          ),
          ListTile(
            trailing: const Icon(
              Icons.file_copy_outlined,
              color: Colors.black,
            ),
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
            trailing: const Icon(
              Icons.border_all,
              color: Colors.black,
            ),
            title: const Text("Exploitation"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ExploitationView()));
            },
          ),
          const Divider(
            color: Colors.black38,
          ),
          ListTile(
            trailing: const Icon(
              Icons.event,
              color: Colors.red,
            ),
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
            trailing: const Icon(
              Icons.file_copy,
              color: Colors.black,
            ),
            title: const Text("Bloc Cathé"),
            onTap: () {
              Navigator.of(context).pop();

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => BlocView()));
            },
          ),
          const Divider(
            color: Colors.black38,
          ),
          ListTile(
            trailing: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
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
