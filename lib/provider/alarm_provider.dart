import 'package:alarm_clock/models/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alarm_clock/screens/home_screen.dart';

class AlarmProviderNotifier extends StateNotifier<List<Alarm>> {
  AlarmProviderNotifier() : super([]);

  void addAlarm(Alarm alarm) {
    state = [...state, alarm];
  }

  void removeAlarm(Alarm alarm) {
    var findAlarm = state.indexWhere((item) => item.alarmTime == alarm.alarmTime);
    if (findAlarm != -1) {
      var newState = List<Alarm>.from(state);
      newState.removeAt(findAlarm);
      state = newState;
    }
  }
}

final alarmProvider = StateNotifierProvider<AlarmProviderNotifier, List<Alarm>>((ref) {
  return AlarmProviderNotifier();
});
