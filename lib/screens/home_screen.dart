import 'package:alarm_clock/widgets/alarm_row.dart';
import 'package:flutter/material.dart';
import 'package:alarm_clock/constants/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat("h:mm a");

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TimeOfDay? _selectedTime;

  void _presentDate() async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
      confirmText: 'Save Alarm',
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null) {
      String selTime =
          timeOfDay.hour.toString() + ':' + timeOfDay.minute.toString() + ':00';
      (
        DateFormat.jm().format(
          DateFormat("hh:mm:ss").parse(selTime),
        ),
      );
      setState(
        () {
          _selectedTime = timeOfDay;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String holdingText;
    if (_selectedTime == null) {
      holdingText = 'Add alarm';
    } else {
      holdingText = "${_selectedTime!.hour}:${_selectedTime!.minute}";
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'A New Dawn',
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.displayMedium,
              color: ksecondaryColor,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.italic,
              fontSize: 48,
            ),
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Add Alarm',
            onPressed: _presentDate,
            icon: Icon(
              Icons.alarm_add,
              color: ksecondaryColor,
            ),
          ),
          SizedBox(
            width: 24,
          ),
        ],
      ),
      backgroundColor: appTheme.primaryColorLight,
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          AlarmRow(
            selectedTime: holdingText,
          ),
          AlarmRow(
            selectedTime: holdingText,
          )
        ],
      ),
    );
  }
}
