import 'package:alarm_clock/models/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alarm_clock/screens/home_screen.dart';

// final alarmProvider = Provider((ref) {
//   return <Alarm>[];
// });

class AlarmProviderNotifier extends StateNotifier<List<Alarm>> {
  AlarmProviderNotifier() : super([]);

  void toggleAlarm(Alarm alarm) {
    state = [...state, alarm];
  }
}

final alarmProvider =
    StateNotifierProvider<AlarmProviderNotifier, List<Alarm>>((ref) {
  return AlarmProviderNotifier();
});
