import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radiologiev2/app/data/models/CenterModel.dart';
import 'package:radiologiev2/app/data/widgets/ClendarTab.dart';
import 'package:radiologiev2/app/data/widgets/Forum.dart';
import 'package:radiologiev2/app/data/widgets/NavugationDrawer.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../controllers/rendezvous_controller.dart';

class RendezvousView extends GetView<RendezvousController> {
  final dateController2 = TextEditingController();
  final CenterController _CenterController = Get.put(CenterController());
  String? defaultLocale;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: SizedBox(
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
                      _CenterController.listCenter.value.forEach((element) {
                        if (element.designCentre == value) {
                          _CenterController.listCenter.value =
                              element as List<Centerv>;
                        }
                      }),
                    },
                selectedItem: _CenterController.Lcenterv.value.designCentre,
                dropdownSearchDecoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8),
                  hintStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(Icons.business),
                  hintText: "Tous Les Centres ",
                  labelStyle: TextStyle(
                    color: Get.theme.primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                )),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.filter_alt_rounded,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FormulaireView(),
              ));
        },
        child: const Icon(Icons.add),
      ),
      body: SfCalendar(
        view: CalendarView.timelineDay,
        todayHighlightColor: Colors.red,
        cellBorderColor: Colors.blue,
        dataSource: MeetingDataSource(getDataSource()),
        monthViewSettings: const MonthViewSettings(
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        showNavigationArrow: true,
        showCurrentTimeIndicator: true,
        showWeekNumber: true,
        weekNumberStyle: const WeekNumberStyle(
          backgroundColor: Colors.pink,
          textStyle: TextStyle(color: Colors.white, fontSize: 15),
        ),
        selectionDecoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.red, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          shape: BoxShape.rectangle,
        ),
      ),
    );
  }
}
