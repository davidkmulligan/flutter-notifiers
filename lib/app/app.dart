import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:pantry/inventory_view/inventory_view.dart';
import 'package:pantry/inventory_view/add_consumable_view.dart';
import 'package:pantry/inventory_view/edit_consumable_view.dart';

import 'package:pantry/app/dataStore.dart';
import 'package:pantry/app/theme.dart' as theme;
import 'package:pantry/settings/settings_veiw.dart';
import 'package:pantry/utils/local_storage.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  late final DataStore dataStore;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    widget.dataStore = DataStore();
    // DataStore.saveTestToDisk();
  }

  @override
  Widget build(BuildContext context) {
    // DataStore.saveToDisk();
    // DataStore.readFromDisk();
    // DataStore.sortInventoryGroupsFromSource();
    // debugPrint('first?');

    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: theme.Palette.primary,
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      // debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const InventoryView(),
        '/add-consumable': (context) => const AddConsumableView(),
        '/edit-consumable': (context) => const EditConsumableView(),
        '/settings': (context) => const SettingsView(),
      },
    );
  }
}
