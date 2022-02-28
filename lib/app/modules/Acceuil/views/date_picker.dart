import 'package:flutter/cupertino.dart';

class DatePicker extends StatefulWidget {
  DatePicker({required Key key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final dateController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}