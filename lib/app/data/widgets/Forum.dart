import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:radiologiev2/app/data/Services/ServiceCenter.dart';
import 'package:radiologiev2/app/data/Services/ServiceMedcin.dart';
import 'package:radiologiev2/app/data/models/CenterModel.dart';
import 'package:radiologiev2/app/data/models/Medcin.dart';
import 'package:radiologiev2/app/data/widgets/DropDownOrganisme.dart';
import 'package:radiologiev2/app/modules/Rendezvous/views/rendezvous_view.dart';

class RendezvousFrom extends StatefulWidget {
  final state = _RendezvousFormState();

  @override
  // ignore: no_logic_in_create_state
  _RendezvousFormState createState() => state;
}

class _RendezvousFormState extends State<RendezvousFrom> {
  final form = GlobalKey<FormState>();
  final dateController = TextEditingController();
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  var items = ['P'];
  var items2 = ['SALLE ECHO 1'];
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
                leading: const Icon(Icons.calendar_today_outlined),
                elevation: 0,
                title: const Text('Rendez Vous'),
                actions: const <Widget>[],
                backgroundColor: Theme.of(context).colorScheme.secondary,
                centerTitle: true,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 19),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onTap: () {
                    Get.defaultDialog(
                      title: ('TOUS LES CENTRES'),
                      content: buildlist(),
                    );
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: ' Center',
                    hintText: 'Tap to choose',
                    icon: Icon(Icons.business),
                    isDense: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: _controller2,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: ' Salle',
                          hintText: 'Tap to choose',
                          icon: Icon(Icons.home_filled),
                          isDense: true,
                        ),
                      ),
                    ),
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.arrow_drop_down),
                      onSelected: (String value) {
                        _controller2.text = value;
                      },
                      itemBuilder: (BuildContext context) {
                        return items2
                            .map<PopupMenuItem<String>>((String value) {
                          return PopupMenuItem(
                              child: Text(value), value: value);
                        }).toList();
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 19),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onTap: () {
                    Get.defaultDialog(
                      title: ('Les Medecins'),
                      content: buildlist2(),
                    );
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: ' Medecin',
                    hintText: 'Tap to choose',
                    icon: Icon(Icons.person_add),
                    isDense: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: _controller,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: ' Type Medecin',
                          hintText: 'Tap to choose',
                          icon: Icon(Icons.home_filled),
                          isDense: true,
                        ),
                      ),
                    ),
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.arrow_drop_down),
                      onSelected: (String value) {
                        _controller.text = value;
                      },
                      itemBuilder: (BuildContext context) {
                        return items.map<PopupMenuItem<String>>((String value) {
                          return PopupMenuItem(
                              child: Text(value), value: value);
                        }).toList();
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 19),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Objet',
                    hintText: 'type here',
                    icon: Icon(Icons.emoji_objects),
                    isDense: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 19),
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
                    hintText: 'Pick your Date',
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
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 19),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: timeinput, //editing controller of this TextField
                  decoration: const InputDecoration(
                      icon: Icon(Icons.timer), //icon of text field
                      labelText: "Enter Time" //label text of field
                      ),
                  readOnly:
                      true, //set it true, so that user will not able to edit text
                  onTap: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context,
                    );
                    if (pickedTime != null) {
                      print(pickedTime.format(context)); //output 10:51 PM
                      DateTime parsedTime = DateFormat.jm()
                          .parse(pickedTime.format(context).toString());
                      //converting to DateTime so that we can further format on different pattern.
                      print(parsedTime); //output 1970-01-01 22:53:00.000
                      String formattedTime =
                          DateFormat('HH:mm:ss').format(parsedTime);
                      print(formattedTime); //output 14:59:00
                      //DateFormat() is from intl package, you can format the time on any pattern you need.

                      setState(() {
                        timeinput.text =
                            formattedTime; //set the value of text field.
                      });
                    } else {
                      print("Time is not selected");
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserForm(),
                          ));
                    },
                    label: const Text('Next'),
                    icon: const Icon(Icons.arrow_right_alt),
                    backgroundColor: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ServiceCenter sc = ServiceCenter();
  late Future<List<Centerv>> futureCenter;
  Widget buildlist() {
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

  ServiceMedcin scm = ServiceMedcin();
  Widget buildlist2() {
    return FutureBuilder<List<Medecin>>(
        future: scm.fetchMedcin(),
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
                          snapshot.data![index].codMed!,
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
}

class UserForm extends StatefulWidget {
  final state = _UserFormState();

  @override
  // ignore: no_logic_in_create_state
  _UserFormState createState() => state;
}

class _UserFormState extends State<UserForm> {
  final form = GlobalKey<FormState>();
  final dateController = TextEditingController();

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
                    child: const Icon(Icons.check),
                    textColor: Colors.white,
                    onPressed: () {
                      if (form.currentState!.validate()) {
                        SnackBar(
                          content: const Text('Rendez vous confirmée'),
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
                backgroundColor: Theme.of(context).colorScheme.secondary,
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
                child: TextFormField(
                  validator: (value) {
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
                  )),
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
                  )),
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
                padding: EdgeInsets.all(12),
                child: DropdownOrganisme(),
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
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
