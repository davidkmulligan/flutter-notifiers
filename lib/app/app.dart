import 'package:flutter/material.dart';

import 'package:pantry/inventory_view/inventory_view.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InventoryView(),
    );
  }
}
