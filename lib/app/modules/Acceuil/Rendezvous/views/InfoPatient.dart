

import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:radiologiev2/app/modules/Acceuil/Rendezvous/views/Ajout%20RendezVous.dart';
import 'package:radiologiev2/app/modules/Acceuil/Rendezvous/views/rendezvous_view.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:radiologiev2/app/modules/Acceuil/controllers/OrganismeController.dart';
import 'package:radiologiev2/models/OrganismeModel.dart';
import 'package:radiologiev2/models/Services/ServiceOrganisme.dart';


class UserForm extends StatefulWidget {
  final state = _UserFormState();


  @override
  // ignore: no_logic_in_create_state
  _UserFormState createState() => state;

}
class _UserFormState extends State<UserForm> {
  final form = GlobalKey<FormState>();
  final dateController = TextEditingController();
  final OrganismeController _OrganismeController = Get.put(OrganismeController());


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Material(
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        child: Form(
          key: form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(
                leading: GestureDetector(
                  onTap: () {
                    Get.to(RendezvousView());
                  },
                  child: Icon(Icons.backspace_outlined),
                ),
                elevation: 0,
                title: const Text('Info Patient'),
                actions: <Widget>[
                  FlatButton(
                    child: Icon(Icons.check),
                    textColor: Colors.white,
                    onPressed: () {
                      if (form.currentState!.validate()) {
                        SnackBar(
                          content: Text('Rendez vous confirmée'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {
                              Get.to(RendezvousFrom());
                            },
                          ),
                        );
                        Get.to(RendezvousView());
                      }
                    },
                  )
                ],
                backgroundColor: Theme
                    .of(context)
                    .colorScheme
                    .secondary,
                centerTitle: true,
              ),

              Padding(
                padding: EdgeInsets.all(12),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: ' Nom',
                    hintText: 'Type your name',
                    icon: Icon(Icons.drive_file_rename_outline),
                    isDense: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: TextFormField(validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: ' Prenom',
                    hintText: 'Type your prenom',
                    icon: Icon(Icons.drive_file_rename_outline),
                    isDense: true,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(12),
                  child: IntlPhoneField(
                    decoration: InputDecoration(
                      labelText: 'Personal Phone Number',
                      hintText: 'Type your personal phone',
                      icon: Icon(Icons.phone_android),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'TN',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  )
              ),

              Padding(
                  padding: EdgeInsets.all(12),
                  child: IntlPhoneField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Home Phone Number',
                      hintText: 'Type your Home number',
                      icon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'TN',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  )
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    hintText: 'Enter your email',
                    icon: Icon(Icons.email),
                    isDense: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  readOnly: true,
                  controller: dateController,
                  decoration: InputDecoration(
                    hintText: 'Date de naissance',
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
                  },),
              ),
                    FutureBuilder(
                        future: _OrganismeController.fetchOrganisme(),
                        builder: (BuildContext context, snapshot) {
                          if (snapshot.hasError) {
                            print(snapshot.error);
                            return Center(
                              child: Text(
                                "Impossible de récupere la liste des clients ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(0, 147, 189, 0.9),
                                ),
                              ),
                            );
                          } else if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return DropdownButtonFormField<Organisme>(
                              decoration: InputDecoration(
                              hintText: 'Organisme',
                              contentPadding: const EdgeInsets.all(5),
                              prefixIcon: const Icon(Icons.business_center),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                              icon: Icon(Icons.arrow_drop_down),
                              value: _OrganismeController.listOrganisme.first,
                              onChanged: (Organisme? newValue) {
                                setState(() {
                                  _OrganismeController.listOrganisme = newValue! as List<Organisme>;
                                });
                              },
                              items: _OrganismeController.listOrganisme
                                  .map<DropdownMenuItem<Organisme>>((Organisme value) {
                                return DropdownMenuItem<Organisme>(
                                  value: value,
                                  child: Text(value.desSoc.toString()),
                                );
                              }).toList(),
                            ) ;
                          } else {
                            return Center(
                              child:CircularProgressIndicator(),
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

}