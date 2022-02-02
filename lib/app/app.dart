import 'package:flutter/material.dart';

import 'package:pantry/inventory_view/inventory_view.dart';
import 'package:pantry/inventory_view/add_consumable_view.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: InventoryView(),
      initialRoute: '/',
      routes: {
        '/': (context) => const InventoryView(),
        'add consumable': (context) => const AddConsumableView(),
      },
    );
  }
}
