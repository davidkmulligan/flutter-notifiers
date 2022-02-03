import 'package:flutter/material.dart';

// import 'package:pantry/models/inventory_group.dart';

import 'package:pantry/inventory_view/components/inventory_list_group.dart';

class InventoryListView extends StatelessWidget {
  const InventoryListView({Key? key, required this.inventoryGroup})
      : super(key: key);

  final List<InventoryListGroup> inventoryGroup;

  @override
  Widget build(BuildContext context) {
    return ListView(children: inventoryGroup);
  }
}
