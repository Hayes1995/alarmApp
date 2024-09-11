import 'package:rxdart/rxdart.dart';

import 'package:alarm_clock/services/navTargets.dart';

class Navigation {
  final _nav = BehaviorSubject<NavTargets>.seeded(NavTargets.home);

  NavTargets get value => _nav.value;

  Stream<NavTargets> get stream => _nav.stream;

  void navigate(NavTargets target) {
    _nav.add(target);
  }
}
