import 'package:alarm_clock/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alarm_clock/widgets/main_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A New Dawn',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
            onPressed: () {},
            icon: Icon(
              Icons.alarm_add,
              color: ksecondaryColor,
            ),
          ),
        ],
      ),
      backgroundColor: appTheme.primaryColorLight,
      drawer: MainDrawer(),
    );
  }
}
