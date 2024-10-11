import 'package:alarm_clock/constants/gradient.dart';
import 'package:alarm_clock/screens/alarm_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alarm_clock/constants/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alarm_clock/widgets/main_drawer.dart';
import 'categories_screen.dart';
import 'package:alarm_clock/services/navigation.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DatePickerApp()));
            },
            icon: Icon(
              Icons.alarm_add,
              color: ksecondaryColor,
            ),
          ),
        ],
      ),
      backgroundColor: appTheme.primaryColorLight,
      drawer: MainDrawer(),
      body: InkWell(
        splashColor: Theme.of(context).primaryColor,
        child: Container(
          alignment: Alignment.center,
          child: TextButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CategoriesScreen()));
            },
            label: Text(
              'Lets start tomorrow differently',
              style: TextStyle(color: Colors.yellowAccent),
            ),
          ),
        ),
      ),
    );
  }
}
    // return CupertinoApp(
    //   home: CupertinoPageScaffold(
    //     navigationBar: CupertinoNavigationBar(
    //       backgroundColor: appTheme.primaryColor,
    //       middle: Text('A New Dawn'),
    //     ),
    //     child: Container(
    //       decoration: BoxDecoration(
    //           gradient: LinearGradient(colors: [
    //         Colors.yellow,
    //         Colors.orange,
    //       ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
    //       child: Center(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             CupertinoButton(
    //               child: Text(
    //                 'Start your day differently',
    //                 style: TextStyle(
    //                   color: const Color.fromARGB(255, 8, 166, 190),
    //                 ),
    //               ),
    //               onPressed: () => Navigator.pushNamed(context, 'CatScreen'),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );