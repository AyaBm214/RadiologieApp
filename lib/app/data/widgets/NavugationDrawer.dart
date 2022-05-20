import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radiologiev2/app/data/Services/ServiceUser.dart';
import 'package:radiologiev2/app/routes/app_pages.dart';

class NavigationDrawer extends StatelessWidget {
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
              ServiceUser.configuration.NomClinique!,
              style: TextStyle(),
            ),
          ),
          if (ServiceUser.blocs.contains("radio"))
            (ListTile(
              trailing: const Icon(
                Icons.file_copy_outlined,
                color: Colors.black,
              ),
              title: const Text("Radio"),
              onTap: () {
                Navigator.of(context).pop();
                Get.toNamed(Routes.LIST_COMPTES_RENDUS);
              },
            )),
          if (ServiceUser.blocs.contains("radio"))
            (const Divider(
              color: Colors.black38,
            )),
          if (ServiceUser.blocs.contains("Exploration"))
            (ListTile(
              trailing: const Icon(
                Icons.border_all,
                color: Colors.black,
              ),
              title: const Text("Exploration"),
              onTap: () {
                Navigator.of(context).pop();
                Get.toNamed(Routes.EXPLOITATION);
              },
            )),
          if (ServiceUser.blocs.contains("Exploration"))
            (const Divider(
              color: Colors.black38,
            )),
          if (ServiceUser.blocs.contains("cathé"))
            (ListTile(
              trailing: const Icon(
                Icons.file_copy,
                color: Colors.black,
              ),
              title: const Text("Bloc Cathé"),
              onTap: () {
                Navigator.of(context).pop();

                Get.toNamed(Routes.BLOC);
              },
            )),
          if (ServiceUser.blocs.contains("cathé"))
            (const Divider(
              color: Colors.black38,
            )),
          ListTile(
            trailing: const Icon(
              Icons.event,
              color: Colors.red,
            ),
            title: const Text("Rendez-vous"),
            onTap: () {
              Navigator.of(context).pop();
              Get.toNamed(Routes.RENDEZVOUS);
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

              Get.toNamed(Routes.LOGIN);
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
