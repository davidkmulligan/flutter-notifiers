import 'package:flutter/material.dart';
import 'package:pantry/inventory_view/inventory_list_group.dart';

import 'package:pantry/models/inventory_group.dart';

class InventoryListView extends StatelessWidget {
  InventoryListView({Key? key, required List<InventoryGroup> groups})
      : super(key: key) {
    listGroups = [];
    for (InventoryGroup group in groups) {
      listGroups.add(InventoryListGroup(group: group));
    }
  }

  late final List<InventoryListGroup> listGroups;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: listGroups,
      ),
    );
  }
}
