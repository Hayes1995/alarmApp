import 'package:alarm_clock/models/alarm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'alarm_provider.g.dart';

@riverpod
class Alarms extends _$Alarms {
  @override
  List<Alarm> build() => [];

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
