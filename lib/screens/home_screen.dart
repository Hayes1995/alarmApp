import 'package:alarm_clock/widgets/alarm_row.dart';
import 'package:flutter/material.dart';
import 'package:alarm_clock/constants/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/alarm.dart';

final formatter = DateFormat("h:mm a");

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Alarm> alarms = [];

  @override
  Widget build(BuildContext context) {
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
            onPressed: () async {
              final TimeOfDay? timeOfDay = await showTimePicker(
                initialTime: TimeOfDay.now(),
                context: context,
                confirmText: 'Save Alarm',
                initialEntryMode: TimePickerEntryMode.dial,
              );
              if (timeOfDay != null) {
                setState(() {
                  alarms.add(Alarm(timeOfDay));
                });
              }
            },
            icon: const Icon(
              Icons.alarm_add,
              color: ksecondaryColor,
            ),
          ),
          const SizedBox(
            width: 24,
          ),
        ],
      ),
      backgroundColor: appTheme.primaryColorLight,
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          for (Alarm alarm in alarms) AlarmRow(alarm: alarm),
          alarms.isEmpty ? const SizedBox(height: 200, child: Center(child: Text('No Alarms'))) : Container(),
        ],
      ),
    );
  }
}
