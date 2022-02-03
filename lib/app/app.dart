import 'package:flutter/material.dart';

import 'package:pantry/inventory_view/inventory_view.dart';
import 'package:pantry/inventory_view/add_consumable_view.dart';

// import 'package:pantry/view.dart';

import 'package:pantry/app/dataStore.dart';
// import 'package:pantry/app/widgetStore.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key) {
    dataStore = DataStore();
    DataStore.sortInventoryGroupsFromSource();
    // widgetStore = WidgetStore();
    // WidgetStore.createFromSource();
  }

  late final DataStore dataStore;
  // late final WidgetStore widgetStore;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: InventoryView(),
      initialRoute: '/',
      routes: {
        '/': (context) => const InventoryView(),
        '/add-consumable': (context) => const AddConsumableView(),
      },
    );
  }
}
