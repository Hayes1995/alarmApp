import 'package:alarm_clock/widgets/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AlarmRow extends StatefulWidget {
  AlarmRow({required this.selectedTime, super.key});

  late String selectedTime;

  @override
  State<AlarmRow> createState() => _AlarmRowState();
}

class _AlarmRowState extends State<AlarmRow> {
  TimeOfDay? _selectedTime;

  void _presentDate() async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
      confirmText: 'Save Alarm',
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null) {
      setState(
        () {
          _selectedTime = timeOfDay;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(0),
      startActionPane: ActionPane(
        motion: ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          SlidableAction(
            onPressed: doNothing,
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {}),
        children: const [
          SlidableAction(
            onPressed: doNothing,
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          widget.selectedTime,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: _presentDate,
        splashColor: const Color.fromARGB(122, 12, 199, 128),
      ),
    );
  }
}

void doNothing(BuildContext context) {}
