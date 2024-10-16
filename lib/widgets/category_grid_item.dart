import 'package:alarm_clock/data/dummy_data.dart';
import 'package:alarm_clock/screens/alarm_screen.dart';
import 'package:flutter/material.dart';
import 'package:alarm_clock/models/category.dart';

class CategoryGridItem extends StatefulWidget {
  CategoryGridItem({super.key, required this.category});

  final Category category;

  @override
  State<CategoryGridItem> createState() => _CategoryGridItemState();
}

class _CategoryGridItemState extends State<CategoryGridItem> {
  Future<String> cubed(String) {
    return Future(() => Text(''));
  }

  void _selectedPlaylist() async {
    final pickedPlaylist = await cubed();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DatePickerApp(),
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.red,
      onTap: _selectedPlaylist,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            widget.category.color.withOpacity(0.55),
            widget.category.color.withOpacity(0.9),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Text(
          widget.category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
        ),
      ),
    );
  }
}
