import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:radiologiev2/app/data/models/CenterModel.dart';
import 'package:radiologiev2/app/data/models/ExamModel.dart';
import 'package:radiologiev2/app/data/models/Medcin.dart';
import 'package:radiologiev2/app/data/models/OrganismeModel.dart';
import 'package:radiologiev2/app/data/models/SalleModel.dart';
import 'package:radiologiev2/app/modules/Rendezvous/controllers/rendezvous_controller.dart';
import 'package:radiologiev2/app/modules/Rendezvous/views/rendezvous_view.dart';
import 'package:radiologiev2/app/routes/app_pages.dart';

class FormulaireView extends GetView<RendezvousController> {
  final form = GlobalKey<FormState>();
  final CenterController _CenterController = Get.put(CenterController());
  final MedecinController _MedecinController = Get.put(MedecinController());
  final SalleController _SalleController = Get.put(SalleController());
  final ExamController _ExamController = Get.put(ExamController());

  String? defaultLocale;

  final dateController = TextEditingController();
  TextEditingController timeinput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: form,
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
                                  child: Text("yes"),
                                ),
                              ),
                              GestureDetector(
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(FormulaireView());
                                  },
                                  child: Text("No"),
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
                  actions: const <Widget>[],
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
                            items: _CenterController.listCenter
                                .map((element) => defaultLocale == "ar"
                                    ? element.designCentre.toString()
                                    : element.designCentre!.toString())
                                .toList(),
                            popupItemDisabled: (String s) => s.startsWith('I'),
                            onChanged: (value) => {
                                  _CenterController.listCenter.value
                                      .forEach((element) {
                                    if (element.designCentre == value) {
                                      _CenterController.listCenter.value =
                                          element as List<Centerv>;
                                    }
                                  }),
                                },
                            selectedItem:
                                _CenterController.Lcenterv.value.designCentre,
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
                            items: _SalleController.listSalle
                                .map((element) => defaultLocale == "ar"
                                    ? element.designation.toString()
                                    : element.designation!.toString())
                                .toList(),
                            popupItemDisabled: (String s) => s.startsWith('I'),
                            onChanged: (value) => {
                                  _SalleController.listSalle.value
                                      .forEach((element) {
                                    if (element.designation == value) {
                                      _SalleController.listSalle.value =
                                          element as List<Salle>;
                                    }
                                  }),
                                },
                            selectedItem:
                                _SalleController.Lsalle.value.designation,
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
                            items: _MedecinController.listMedecinM
                                .map((element) => element.nomMed.toString())
                                .toList(),
                            popupItemDisabled: (String s) => s.startsWith('I'),
                            onChanged: (value) => {
                                  _MedecinController.listMedecin.value
                                      .forEach((element) {
                                    if (element.typMed == value) {
                                      _MedecinController.listMedecinM.value =
                                          element as List<Medecin>;
                                    }
                                  }),
                                },
                            selectedItem:
                                _MedecinController.LMedecin.value.nomMed,
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
                            items: _MedecinController.listMedecinP
                                .map((element) => element.nomMed.toString())
                                .toList(),
                            popupItemDisabled: (String s) => s.startsWith('I'),
                            onChanged: (value) => {
                                  _MedecinController.listMedecinP.value
                                      .forEach((element) {
                                    if (element.typMed == value) {
                                      _MedecinController.listMedecinP.value =
                                          element as List<Medecin>;
                                    }
                                  }),
                                },
                            selectedItem:
                                _MedecinController.LMedecin.value.typMed,
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
                        () => DropdownSearch<String>(
                            mode: Mode.BOTTOM_SHEET,
                            showSearchBox: true,
                            items: _ExamController.listExam
                                .map((element) => defaultLocale == "ar"
                                    ? element.desexam.toString()
                                    : element.desexam!.toString())
                                .toList(),
                            popupItemDisabled: (String s) => s.startsWith('I'),
                            onChanged: (value) => {
                                  _ExamController.listExam.value
                                      .forEach((element) {
                                    if (element.desexam == value) {
                                      _ExamController.listExam.value =
                                          element as List<Exam>;
                                    }
                                  }),
                                },
                            selectedItem: _ExamController.LExam.value.desexam,
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
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              readOnly: true,
                              controller: dateController,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(5),
                                  hintText: "Pick your Date",
                                  hintStyle:
                                      const TextStyle(color: Colors.blueGrey),
                                  prefixIcon:
                                      const Icon(Icons.calendar_today_outlined),
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
                                          width: 1.0))),
                              onTap: () async {
                                var date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100));
                                dateController.text =
                                    date.toString().substring(0, 10);
                              },
                            ))),
                        SizedBox(
                            width: 170,
                            child: SafeArea(
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                                controller: timeinput,
                                //editing controller of this TextField
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(5),
                                    hintText: "Enter Time",
                                    hintStyle:
                                        const TextStyle(color: Colors.blueGrey),
                                    prefixIcon: const Icon(Icons.timer),
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
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                            color: Get.theme.primaryColor,
                                            width: 1.0))),
                                readOnly: true,
                                //set it true, so that user will not able to edit text
                                onTap: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    initialTime: TimeOfDay.now(),
                                    context: context,
                                  );
                                  if (pickedTime != null) {
                                    print(pickedTime
                                        .format(context)); //output 10:51 PM
                                    DateTime parsedTime = DateFormat.jm().parse(
                                        pickedTime.format(context).toString());
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
                                  } else {
                                    print("Time is not selected");
                                  }
                                },
                              ),
                            )),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        if (form.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InfoUserView(),
                              ));
                        }
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
      ),
    );
  }
}

class InfoUserView extends GetView<RendezvousController> {
  final form = GlobalKey<FormState>();
  final dateController = TextEditingController();
  final OrganismeController _OrganismeController =
      Get.put(OrganismeController());
  String? defaultLocale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Form(
            key: form,
            child: Column(
              children: <Widget>[
                AppBar(
                  leading: GestureDetector(
                    onTap: () {
                      Get.to(FormulaireView());
                    },
                    child: const Icon(Icons.arrow_back_ios_sharp),
                  ),
                  elevation: 0,
                  title: const Text('Info Patient'),
                  actions: <Widget>[
                    FlatButton(
                        child: const Icon(Icons.check),
                        textColor: Colors.white,
                        onPressed: () {
                          if (form.currentState!.validate()) {
                            Get.snackbar(
                                'Rendez_vous', 'Rendez-vous Confirmeé ',
                                snackPosition: SnackPosition.TOP);
                            Get.toNamed(Routes.LIST_COMPTES_RENDUS);
                          }
                        })
                  ],
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  centerTitle: true,
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
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: "type your name",
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
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: "type your last name",
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
                Padding(
                    padding: const EdgeInsets.all(12),
                    child: IntlPhoneField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: "type your person Number",
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
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    )),
                Padding(
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
                          hintText: "Type your Home Number",
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
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                      validator: (value) {
                        return controller.validateEmail(value!);
                      },
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: "type your Email",
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
                            items: _OrganismeController.listOrganisme
                                .map((element) => defaultLocale == "ar"
                                    ? element.desSoc!.toString()
                                    : element.desSoc!.toString())
                                .toList(),
                            popupItemDisabled: (String s) => s.startsWith('I'),
                            onChanged: (value) => {
                                  _OrganismeController.listOrganisme.value
                                      .forEach((element) {
                                    if (element.desSoc == value) {
                                      _OrganismeController.listOrganisme.value =
                                          element as List<Organisme>;
                                    }
                                  }),
                                },
                            selectedItem:
                                _OrganismeController.LOrganisme.value.desSoc,
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
                        contentPadding: const EdgeInsets.all(10),
                        hintText: "type your date of Birth",
                        hintStyle: const TextStyle(color: Colors.blueGrey),
                        prefixIcon: const Icon(Icons.calendar_today_outlined),
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
      ),
    );
  }
}
