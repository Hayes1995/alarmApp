import 'package:alarm_clock/constants/themes.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  GradientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          kprimaryColor,
          ksecondaryColor,
        ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
      ),
    );
  }
}
