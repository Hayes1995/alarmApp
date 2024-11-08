import 'package:alarm_clock/provider/alarm_provider.dart';
import 'package:alarm_clock/widgets/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/alarm.dart';

class AlarmRow extends ConsumerStatefulWidget {
  AlarmRow({required this.alarm, super.key});

  final Alarm alarm;

  @override
  ConsumerState<AlarmRow> createState() => _AlarmRowState();
}

late Alarm alarm;

class _AlarmRowState extends ConsumerState<AlarmRow> {
  @override
  Widget build(BuildContext context) {
    String alarm_text;
    var alarmTime = widget.alarm.alarmTime;
    var minute = alarmTime.minute.toString().padLeft(2, "0");
    switch (alarmTime.hour) {
      case >= 12:
        alarm_text = "${alarmTime.hour - 12}:${minute} PM";
      case == 12:
        alarm_text = "${alarmTime.hour}:${minute} PM";
      case == 0:
        alarm_text = "${alarmTime.hour + 12}:${minute} AM";
      default:
        alarm_text = "${alarmTime.hour}:${minute} AM";
    }
    return Slidable(
      key: UniqueKey(),
      startActionPane: ActionPane(
        motion: ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {}),
        children: const [
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
        children: [
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
          alarm_text,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () async {
          final TimeOfDay? timeOfDay = await showTimePicker(
            initialTime: TimeOfDay.now(),
            context: context,
            confirmText: 'Save Alarm',
            initialEntryMode: TimePickerEntryMode.dial,
          );
          if (timeOfDay != null) {
            setState(() {
              ref.read(alarmProvider.notifier).toggleAlarm(alarm);
            });
          }
        },
        splashColor: const Color.fromARGB(122, 12, 199, 128),
      ),
    );
  }
}

void doNothing(BuildContext context) {}
