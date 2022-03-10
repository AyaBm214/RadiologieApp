import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radiologiev2/app/data/widgets/ClendarTab.dart';
import 'package:radiologiev2/app/data/widgets/Forum.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../controllers/rendezvous_controller.dart';

class RendezvousView extends GetView<RendezvousController> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RendezvousFrom(),
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
      ),
    );
  }
}
