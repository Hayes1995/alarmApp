import 'package:alarm_clock/constants/themes.dart';
import 'package:alarm_clock/screens/categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat();

class DatePickerApp extends StatefulWidget {
  DatePickerApp({super.key});
  @override
  State<DatePickerApp> createState() {
    return _DatePickerAppState();
  }
}

class _DatePickerAppState extends State<DatePickerApp> {
  DateTime? _selectedDate;
  String? pickedPlaylist;

  void _presentDate() async {
    final pickedDate = await showOmniDateTimePicker(
      context: context,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.primaryColorLight,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: _presentDate,
              child: const Text('Show DateTime Picker'),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              child: Text(
                _selectedDate == null
                    ? 'No date selected'
                    : formatter.format(_selectedDate!),
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            SizedBox(
              child: Text(pickedPlaylist == null
                  ? 'No playlist selected'
                  : '$pickedPlaylist'),
            ),
          ],
        ),
      ),
    );
  }
}













// return const CupertinoApp(
//   theme: CupertinoThemeData(brightness: Brightness.light),
//   home: DatePickerApp(),
// );

// void main() => runApp(const DatePickerApp(''));

// class DatePickerApp extends StatelessWidget {
//   const DatePickerApp(this.name, {super.key});

//   final String name;

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       restorationScopeId: 'app',
//       home: DatePickerApp(restorationId: 'main'),
//     );
//   }
// }

// class DatePickerApp extends StatefulWidget {
//   const DatePickerApp({super.key, this.restorationId});

//   final String? restorationId;

//   @override
//   State<DatePickerApp> createState() => _DatePickerState();
// }

// class _DatePickerState extends State<DatePickerApp> with RestorationMixin {
//   @override
//   String? get restorationId => widget.restorationId;

//   final RestorableDateTime _selectedDate =
//       RestorableDateTime(DateTime(2021, 7, 25));
//   late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
//       RestorableRouteFuture<DateTime?>(
//     onComplete: _selectDate,
//     onPresent: (NavigatorState navigator, Object? arguments) {
//       return navigator.restorablePush(
//         _datePickerRoute,
//         arguments: _selectedDate.value.millisecondsSinceEpoch,
//       );
//     },
//   );

//   @pragma('vm:entry-point')
//   static Route<DateTime> _datePickerRoute(
//     BuildContext context,
//     Object? arguments,
//   ) {
//     return DialogRoute<DateTime>(
//       context: context,
//       builder: (BuildContext context) {
//         return DatePickerDialog(
//           restorationId: 'date_picker_dialog',
//           initialEntryMode: DatePickerEntryMode.calendar,
//           initialDate: DateTime.now(),
//           firstDate: DateTime.now(),
//           lastDate: DateTime(2025),
//         );
//       },
//     );
//   }

//   @override
//   void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
//     registerForRestoration(_selectedDate, 'selected_date');
//     registerForRestoration(
//         _restorableDatePickerRouteFuture, 'date_picker_route_future');
//   }

//   void _selectDate(DateTime? newSelectedDate) {
//     if (newSelectedDate != null) {
//       setState(() {
//         _selectedDate.value = newSelectedDate;
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text(
//               'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
//         ));
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: OutlinedButton(
//           onPressed: () {
//             _restorableDatePickerRouteFuture.present();
//           },
//           child: const Text('Open Date Picker'),
//         ),

//       ),

//     );
//   }
// }

// class DatePickerApp extends StatefulWidget {
//   const DatePickerApp({super.key});

//   @override
//   State<DatePickerApp> createState() => _DatePickerState();
// }

// class _DatePickerState extends State<DatePickerApp> {
//   DateTime date = DateTime.now();
//   DateTime time = DateTime.now();

//   void _showDialog(Widget child) {
//     showCupertinoModalPopup<void>(
//       context: context,
//       builder: (BuildContext context) => Container(
//         height: 216,
//         padding: const EdgeInsets.only(top: 6.0),
//         margin: EdgeInsets.only(
//           bottom: MediaQuery.of(context).viewInsets.bottom,
//         ),
//         color: Theme.of(context).primaryColor,
//         child: SafeArea(
//           top: false,
//           child: child,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoApp(
//       home: CupertinoPageScaffold(
//         navigationBar: const CupertinoNavigationBar(
//           middle: Text('Alarm Time'),
//         ),
//         child: DefaultTextStyle(
//           style: TextStyle(
//             color: Theme.of(context).primaryColor,
//             fontSize: 22.0,
//           ),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 _DatePickerItem(
//                   children: <Widget>[
//                     const Text('Date'),
//                     CupertinoButton(
//                       onPressed: () => _showDialog(
//                         CupertinoDatePicker(
//                           initialDateTime: date,
//                           mode: CupertinoDatePickerMode.date,
//                           use24hFormat: true,
//                           showDayOfWeek: true,
//                           onDateTimeChanged: (DateTime newDate) {
//                             setState(() => date = newDate);
//                           },
//                         ),
//                       ),
//                       child: Text(
//                         '${date.month}-${date.day}-${date.year}',
//                         style: const TextStyle(
//                           fontSize: 22.0,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 _DatePickerItem(
//                   children: <Widget>[
//                     const Text('Time'),
//                     CupertinoButton(
//                       onPressed: () => _showDialog(
//                         CupertinoDatePicker(
//                           initialDateTime: time,
//                           mode: CupertinoDatePickerMode.time,
//                           use24hFormat: true,
//                           onDateTimeChanged: (DateTime newTime) {
//                             setState(() => time = newTime);
//                           },
//                         ),
//                       ),
//                       child: Text(
//                         '${time.hour}:${time.minute}',
//                         style: const TextStyle(
//                           fontSize: 22.0,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 36),
//                 TextButton(
//                   child: Text('Select Playlist'),
//                   onPressed: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => CategoriesScreen(),
//                       ),
//                     );
//                   },
//                 ),
//                 SizedBox(height: 24),
//                 TextButton(
//                   onPressed: () {},
//                   child: Text('Save'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _DatePickerItem extends StatelessWidget {
//   const _DatePickerItem({required this.children});

//   final List<Widget> children;

//   @override
//   Widget build(BuildContext context) {
//     return DecoratedBox(
//       decoration: const BoxDecoration(
//         border: Border(
//           top: BorderSide(
//             color: CupertinoColors.inactiveGray,
//             width: 0.0,
//           ),
//           bottom: BorderSide(
//             color: CupertinoColors.inactiveGray,
//             width: 0.0,
//           ),
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: children,
//         ),
//       ),
//     );
//   }
// }
