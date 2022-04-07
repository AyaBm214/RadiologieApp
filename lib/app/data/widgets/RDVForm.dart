import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:radiologiev2/app/data/models/Medcin.dart';
import 'package:radiologiev2/app/data/models/RendezVousModel.dart';
import 'package:radiologiev2/app/modules/Rendezvous/controllers/rendezvous_controller.dart';
import 'package:radiologiev2/app/modules/Rendezvous/views/rendezvous_view.dart';
import 'package:radiologiev2/app/routes/app_pages.dart';

class FormulaireView extends GetView<RendezvousController> {
  final form_rdv = GlobalKey<FormState>();
  final RendezvousController rendezvousController =
      Get.put(RendezvousController());
  final RendezVous rdv = RendezVous();
  String? defaultLocale;
  TextEditingController dateRdvController = TextEditingController();
  TextEditingController dateBirthController = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  TextEditingController Dateinput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    dateBirthController.text = DateTime.now().weekday.toString() +
        "-" +
        DateTime.now().month.toString() +
        "-" +
        DateTime.now().year.toString();
    dateRdvController.text = DateTime.now().weekday.toString() +
        "-" +
        DateTime.now().month.toString() +
        "-" +
        DateTime.now().year.toString();
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: form_rdv,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                AppBar(
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Save and Exit?'),
                            content: const Text(
                                'are you sure you want to save and exit?'),
                            actions: [
                              GestureDetector(
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(RendezvousView());
                                  },
                                  child: const Text("yes"),
                                ),
                              ),
                              GestureDetector(
                                child: TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text("No"),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                      // Navigator.pop(context);
                    },
                  ),
                  elevation: 0,
                  title: const Text('Rendez Vous'),
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if (form_rdv.currentState!.validate()) {
                          print(rdv.toString());
                          {
                            Get.snackbar(
                                'Confirmation', 'RendezVous Confirmée ',
                                snackPosition: SnackPosition.BOTTOM);
                            Get.toNamed(Routes.RENDEZVOUS);
                          }
                        } else {
                          Get.snackbar('Error', 'RendezVous non Confirmée',
                              snackPosition: SnackPosition.BOTTOM);
                        }
                      },
                    ),
                  ],
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  centerTitle: true,
                ),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(12),
                    child: SizedBox(
                      child: Obx(
                        () => DropdownSearch<String>(
                            mode: Mode.BOTTOM_SHEET,
                            showSearchBox: true,
                            items: rendezvousController.listCenter
                                .map((element) => defaultLocale == "ar"
                                    ? element.designCentre.toString()
                                    : element.designCentre!.toString())
                                .toList(),
                            onChanged: (value) => {
                                  rdv.Centre = value!,
                                  print(value),
                                  rendezvousController.listCenter.value
                                      .forEach((element) {
                                    if (element.designCentre == value) {
                                      rendezvousController.Lcenterv.value =
                                          element;
                                    }
                                  }),
                                },
                            selectedItem: rendezvousController
                                .Lcenterv.value.designCentre,
                            dropdownSearchDecoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                hintText: "Select Center",
                                hintStyle:
                                    const TextStyle(color: Colors.blueGrey),
                                prefixIcon: const Icon(Icons.business_center),
                                labelStyle: TextStyle(
                                  color: Get.theme.primaryColor,
                                  fontWeight: FontWeight.w700,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                      color: Get.theme.primaryColor,
                                      width: 1.0),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(
                                        color: Get.theme.primaryColor,
                                        width: 1.0)))),
                      ),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(12),
                    child: SizedBox(
                      child: Obx(
                        () => DropdownSearch<String>(
                            mode: Mode.BOTTOM_SHEET,
                            showSearchBox: true,
                            items: rendezvousController.listSalle
                                .map((element) => defaultLocale == "ar"
                                    ? element.designation.toString()
                                    : element.designation!.toString())
                                .toList(),
                            onChanged: (value) => {
                                  rdv.Salle = value!,
                                  print(value),
                                  rendezvousController.listSalle.value
                                      .forEach((element) {
                                    if (element.designation == value) {
                                      rendezvousController.Lsalle.value =
                                          element;
                                    }
                                  }),
                                },
                            selectedItem:
                                rendezvousController.Lsalle.value.designation,
                            dropdownSearchDecoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                hintText: "Select Salle",
                                hintStyle:
                                    const TextStyle(color: Colors.blueGrey),
                                prefixIcon: const Icon(Icons.home_outlined),
                                labelStyle: TextStyle(
                                  color: Get.theme.primaryColor,
                                  fontWeight: FontWeight.w700,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                      color: Get.theme.primaryColor,
                                      width: 1.0),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(
                                        color: Get.theme.primaryColor,
                                        width: 1.0)))),
                      ),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(12),
                    child: SizedBox(
                      child: Obx(
                        () => DropdownSearch<String>(
                            mode: Mode.BOTTOM_SHEET,
                            showSearchBox: true,
                            items: rendezvousController.listMedecinM
                                .map((element) => element.nomMed.toString())
                                .toList(),
                            onChanged: (value) => {
                                  rdv.medecinM = value!,
                                  print(value),
                                  rendezvousController.listMedecin.value
                                      .forEach((element) {
                                    if (element.typMed == value) {
                                      rendezvousController.listMedecinM.value =
                                          element as List<Medecin>;
                                    }
                                  }),
                                },
                            selectedItem:
                                rendezvousController.LMedecin.value.nomMed,
                            dropdownSearchDecoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                hintText: "Select Medecin M",
                                hintStyle:
                                    const TextStyle(color: Colors.blueGrey),
                                prefixIcon: const Icon(Icons.search),
                                labelStyle: TextStyle(
                                  color: Get.theme.primaryColor,
                                  fontWeight: FontWeight.w700,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                      color: Get.theme.primaryColor,
                                      width: 1.0),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(
                                        color: Get.theme.primaryColor,
                                        width: 1.0)))),
                      ),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(12),
                    child: SizedBox(
                      child: Obx(
                        () => DropdownSearch<String>(
                            mode: Mode.BOTTOM_SHEET,
                            showSearchBox: true,
                            items: rendezvousController.listMedecinP
                                .map((element) => element.nomMed.toString())
                                .toList(),
                            onChanged: (value) => {
                                  rdv.medecinP = value!,
                                  print(value),
                                  rendezvousController.listMedecinP.value
                                      .forEach((element) {
                                    if (element.typMed == value) {
                                      rendezvousController.listMedecinP.value =
                                          element as List<Medecin>;
                                    }
                                  }),
                                },
                            selectedItem:
                                rendezvousController.LMedecin.value.typMed,
                            dropdownSearchDecoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                hintText: "Select Medecin P",
                                hintStyle:
                                    const TextStyle(color: Colors.blueGrey),
                                prefixIcon: const Icon(Icons.search),
                                labelStyle: TextStyle(
                                  color: Get.theme.primaryColor,
                                  fontWeight: FontWeight.w700,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                      color: Get.theme.primaryColor,
                                      width: 1.0),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(
                                        color: Get.theme.primaryColor,
                                        width: 1.0)))),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                      onChanged: (value) {
                        rdv.objet = value;
                        print(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: " Objet",
                          hintStyle: const TextStyle(color: Colors.blueGrey),
                          prefixIcon: const Icon(Icons.emoji_objects),
                          labelStyle: TextStyle(
                            color: Get.theme.primaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                                color: Get.theme.primaryColor, width: 1.0),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                  color: Get.theme.primaryColor, width: 1.0)))),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(12),
                    child: SizedBox(
                      child: Obx(
                        //todo ====> multiple select dropdow
                        () => DropdownSearch<String>(
                            mode: Mode.BOTTOM_SHEET,
                            showSearchBox: true,
                            items: rendezvousController.listExam
                                .map((element) => defaultLocale == "ar"
                                    ? element.codexam!.toString() +
                                        " / " +
                                        element.desexam.toString()
                                    : element.codexam!.toString() +
                                        " / " +
                                        element.desexam!.toString())
                                .toList(),
                            onChanged: (value) => {
                                  rdv.Exam = value!,
                                  print(value),
                                  rendezvousController.listExam.value
                                      .forEach((element) {
                                    if (element.desexam == value) {
                                      rendezvousController.LExam.value =
                                          element;
                                    }
                                  }),
                                },
                            selectedItem:
                                rendezvousController.LExam.value.desexam,
                            dropdownSearchDecoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                hintText: "Code/designation",
                                hintStyle:
                                    const TextStyle(color: Colors.blueGrey),
                                prefixIcon: const Icon(Icons.home_outlined),
                                labelStyle: TextStyle(
                                  color: Get.theme.primaryColor,
                                  fontWeight: FontWeight.w700,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                      color: Get.theme.primaryColor,
                                      width: 1.0),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(
                                        color: Get.theme.primaryColor,
                                        width: 1.0)))),
                      ),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        SizedBox(
                            width: 170,
                            child: SafeArea(
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Veuillez choisir date rendez vous';
                                  }
                                  return null;
                                },
                                readOnly: true,
                                //todo change name of controller datebirth -_-
                                controller: dateRdvController,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(5),
                                    hintText: " Date Rdv",
                                    hintStyle:
                                        const TextStyle(color: Colors.blueGrey),
                                    prefixIcon:
                                        const Icon(Icons.calendar_today),
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ))),

                                /*initialValue:
                                    DateTime.now().weekday.toString() +
                                        "-" +
                                        DateTime.now().month.toString() +
                                        "-" +
                                        DateTime.now().year.toString(),*/
                                onTap: () async {
                                  DatePicker.showDatePicker(context,
                                      showTitleActions: true,
                                      minTime: DateTime.now(),
                                      maxTime: DateTime(2025, 6, 7),
                                      onChanged: (date) {
                                    rdv.Daterdv = date;
                                    dateRdvController.text =
                                        date.weekday.toString() +
                                            "-" +
                                            date.month.toString() +
                                            "-" +
                                            date.year.toString();
                                    print(date);
                                  }, onConfirm: (date) {
                                    rdv.Daterdv = date;
                                    print(date);
                                  },
                                      currentTime: DateTime.now(),
                                      locale: LocaleType.en);
                                },
                              ),
                            )),
                        Container(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SizedBox(
                                width: 150,
                                child: SafeArea(
                                    child: TextField(
                                  controller:
                                      timeinput, //editing controller of this TextField
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(5),
                                      hintText: " Heure",
                                      hintStyle: const TextStyle(
                                          color: Colors.blueGrey),
                                      prefixIcon: const Icon(Icons.timer),
                                      labelStyle: TextStyle(
                                        color: Get.theme.primaryColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                          color: Get.theme.primaryColor,
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          borderSide: BorderSide(
                                            color: Get.theme.primaryColor,
                                          ))),
                                  readOnly:
                                      true, //set it true, so that user will not able to edit text
                                  onTap: () async {
                                    TimeOfDay? pickedTime =
                                        await showTimePicker(
                                      initialTime: TimeOfDay.now(),
                                      context: context,
                                    );

                                    if (pickedTime != null) {
                                      print(pickedTime
                                          .format(context)); //output 10:51 PM
                                      DateTime parsedTime = DateFormat.jm()
                                          .parse(pickedTime
                                              .format(context)
                                              .toString());
                                      //converting to DateTime so that we can further format on different pattern.
                                      print(
                                          parsedTime); //output 1970-01-01 22:53:00.000
                                      String formattedTime =
                                          DateFormat('HH:mm:ss')
                                              .format(parsedTime);
                                      print(formattedTime); //output 14:59:00
                                      //DateFormat() is from intl package, you can format the time on any pattern you need.
                                      {
                                        timeinput.text =
                                            formattedTime; //set the value of text field.
                                      }
                                      ;
                                    } else {
                                      print("Time is not selected");
                                    }
                                  },
                                  onChanged: (value) {
                                    rdv.Heurerdv = DateTime.parse(value);
                                    print("ccc $value");
                                  },
                                ))),
                          ),
                        ),
                      ],
                    )),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                      onChanged: (value) {
                        rdv.nomCli = value;
                        print(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: "Name",
                          hintStyle: const TextStyle(color: Colors.blueGrey),
                          prefixIcon: const Icon(Icons.person),
                          labelStyle: TextStyle(
                            color: Get.theme.primaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                                color: Get.theme.primaryColor, width: 1.0),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                  color: Get.theme.primaryColor, width: 1.0)))),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                      onChanged: (value) {
                        rdv.prenom = value;
                        print(value);
                        //print("onChanged: "+ServiceUser.username);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: " Last name",
                          hintStyle: const TextStyle(color: Colors.blueGrey),
                          prefixIcon: const Icon(Icons.person),
                          labelStyle: TextStyle(
                            color: Get.theme.primaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                                color: Get.theme.primaryColor, width: 1.0),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                  color: Get.theme.primaryColor, width: 1.0)))),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(12),
                    child: IntlPhoneField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: "Person Number",
                          hintStyle: const TextStyle(color: Colors.blueGrey),
                          prefixIcon: const Icon(Icons.send_to_mobile),
                          labelStyle: TextStyle(
                            color: Get.theme.primaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                                color: Get.theme.primaryColor, width: 1.0),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                  color: Get.theme.primaryColor, width: 1.0))),
                      initialCountryCode: 'TN',
                      onChanged: (value) {
                        rdv.tel = value;
                        print(value);
                      },
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(12),
                    child: IntlPhoneField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: " Home Number",
                          hintStyle: const TextStyle(color: Colors.blueGrey),
                          prefixIcon: const Icon(Icons.phone),
                          labelStyle: TextStyle(
                            color: Get.theme.primaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                                color: Get.theme.primaryColor, width: 1.0),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                  color: Get.theme.primaryColor, width: 1.0))),
                      initialCountryCode: 'TN',
                      onChanged: (value) {
                        rdv.telperson = value;
                        print(value);
                      },
                    )),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                      onChanged: (value) {
                        rdv.email = value;
                        print(value);
                      },
                      validator: (value) {
                        return rendezvousController.validateEmail(value!);
                      },
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: " Email",
                          hintStyle: const TextStyle(color: Colors.blueGrey),
                          prefixIcon: const Icon(Icons.email_outlined),
                          labelStyle: TextStyle(
                            color: Get.theme.primaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                                color: Get.theme.primaryColor, width: 1.0),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                  color: Get.theme.primaryColor, width: 1.0)))),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(12),
                    child: SizedBox(
                      child: Obx(
                        () => DropdownSearch<String>(
                            mode: Mode.BOTTOM_SHEET,
                            showSearchBox: true,
                            items: rendezvousController.listOrganisme
                                .map((element) => defaultLocale == "ar"
                                    ? element.desSoc!.toString()
                                    : element.desSoc!.toString())
                                .toList(),
                            onChanged: (value) => {
                                  rdv.organisme = value!,
                                  print(value),
                                  rendezvousController.listOrganisme.value
                                      .forEach((element) {
                                    if (element.desSoc == value) {
                                      rendezvousController.LOrganisme.value =
                                          element;
                                    }
                                  }),
                                },
                            selectedItem:
                                rendezvousController.LOrganisme.value.desSoc,
                            dropdownSearchDecoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                hintText: "Select Organisme",
                                hintStyle:
                                    const TextStyle(color: Colors.blueGrey),
                                prefixIcon: const Icon(Icons.work),
                                labelStyle: TextStyle(
                                  color: Get.theme.primaryColor,
                                  fontWeight: FontWeight.w700,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                      color: Get.theme.primaryColor,
                                      width: 1.0),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(
                                        color: Get.theme.primaryColor,
                                        width: 1.0)))),
                      ),
                    )),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    controller: dateBirthController,
                    onChanged: (value) {
                      dateBirthController.text = value.toString();
                      print(value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    readOnly: true,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: " Date of Birth",
                        hintStyle: const TextStyle(color: Colors.blueGrey),
                        prefixIcon: const Icon(Icons.calendar_today_outlined),
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0))),
                    onTap: () async {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2000, 3, 5),
                          maxTime: DateTime(2025, 6, 7),
                          onChanged: (date) {}, onConfirm: (date) {
                        print('confirm $date');
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
