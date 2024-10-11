import 'package:alarm_clock/main.dart';
import 'package:alarm_clock/screens/categories_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

// void main() => runApp(MyApp());

// class CupNav extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoApp(
//       routes: {
//         'CatScreen': (_) => CategoriesScreen(),
//       },
//     );
//   }
// }
