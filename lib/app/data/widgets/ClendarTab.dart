import 'package:flutter/material.dart';
import 'package:time_planner/time_planner.dart';

List<TimePlannerTask> tasks = [
  TimePlannerTask(
    // background color for task
    color: Colors.purple,
    // day: Index of header, hour: Task will be begin at this hour
    // minutes: Task will be begin at this minutes
    dateTime: TimePlannerDateTime(day: 0, hour: 14, minutes: 30),
    // Minutes duration of task
    minutesDuration: 90,
    // Days duration of task (use for multi days task)
    daysDuration: 1,
    onTap: () {},
    child: Text(
      'this is a task',
      style: TextStyle(color: Colors.grey[350], fontSize: 12),
    ),
  ),
];
