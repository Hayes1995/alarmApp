import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({
    super.key,
    // required this.onSelectScreen,
  });

  // final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.sunny,
                    size: 48, color: Theme.of(context).colorScheme.primary),
                SizedBox(
                  width: 18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
