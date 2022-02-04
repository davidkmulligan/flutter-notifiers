import 'package:flutter/material.dart';

import 'package:pantry/inventory_view/inventory_view.dart';
import 'package:pantry/inventory_view/add_consumable_view.dart';
import 'package:pantry/inventory_view/edit_consumable_view.dart';

import 'package:pantry/app/dataStore.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key) {
    dataStore = DataStore();
    DataStore.sortInventoryGroupsFromSource();
  }

  late final DataStore dataStore;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const InventoryView(),
        '/add-consumable': (context) => const AddConsumableView(),
        '/edit-consumable': (context) => const EditConsumableView(),
      },
    );
  }
}
