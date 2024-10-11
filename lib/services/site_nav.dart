import 'package:alarm_clock/screens/alarm_screen.dart';
import 'package:alarm_clock/screens/categories_screen.dart';
import 'package:alarm_clock/screens/home_screen.dart';
import 'package:alarm_clock/services/navTargets.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:alarm_clock/services/navigation.dart';

class SiteContent extends StatelessWidget {
  const SiteContent({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: GetIt.I<Navigation>().stream,
      builder: (BuildContext context, AsyncSnapshot<NavTargets> snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        switch (snapshot.data!) {
          case NavTargets.home:
            return HomeScreen();
          case NavTargets.playlists:
            return CategoriesScreen();
          case NavTargets.alarm:
            return DatePickerApp();
          default:
            return const Placeholder();
        }
      },
    );
  }
}
