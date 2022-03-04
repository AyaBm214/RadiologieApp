import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/rendezvous_controller.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'Ajout RendezVous.dart';
import 'ClendarTab.dart';

class RendezvousView extends GetView<RendezvousController> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserForm(),
              ));
        },
        child: Icon(Icons.add),
        ),
        body: Container(
          child: SfCalendar(
            view: CalendarView.timelineDay,
            todayHighlightColor: Colors.red,
            cellBorderColor: Colors.blue,
            dataSource: MeetingDataSource(getDataSource()),
            monthViewSettings: MonthViewSettings(
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
        ),
      ),
    );
  }
    List<Meeting> getDataSource() {
      final List<Meeting> meetings = <Meeting>[];
      final DateTime today = DateTime.now();
      final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
      final DateTime endTime = startTime.add(const Duration(hours: 2));
      meetings.add(Meeting(
          'Appointment', startTime, endTime, const Color(0xFF0F8644), false));
      return meetings;
    }
  }



