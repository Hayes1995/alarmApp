import 'package:alarm_clock/services/navTargets.dart';
import 'package:alarm_clock/services/navigation.dart';
import 'package:flutter/material.dart';
import 'package:alarm_clock/constants/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alarm_clock/widgets/main_drawer.dart';
import 'package:get_it/get_it.dart';
import 'package:alarm_clock/services/navTargets.dart';
import 'package:alarm_clock/services/navigation.dart';
import 'package:alarm_clock/services/site_nav.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

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
      body: InkWell(
        splashColor: Theme.of(context).primaryColor,
        child: Container(
          alignment: Alignment.center,
          child: TextButton.icon(
            onPressed: () {
              GetIt.I<Navigation>().navigate(NavTargets.playlists);
            },
            label: Text('Lets start tomorrow differently'),
          ),
        ),
      ),
    );
  }
}
