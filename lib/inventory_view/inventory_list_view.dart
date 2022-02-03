// import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';

// import 'package:pantry/models/inventory_group.dart';
// import 'package:pantry/app/store.dart';

// import 'inventory_list_group.dart';

// class InventoryListView extends StatelessWidget {
//   InventoryListView({Key? key, required this.inventoryGroup}) : super(key: key);

//   final List<InventoryGroup> inventoryGroup;

//   @override
//   Widget build(BuildContext context) {
//     // final _activeListenableVaule = (groupName == 'Location')
//     //     ? Store.locationGroups
//     //     : Store.alphabeticalGroups;
//     final List<InventoryListGroup> _listGroup = [];

//     // return ValueListenableBuilder(
//     //   valueListenable: _activeListenableVaule,
//     // builder: (context, List<InventoryGroup> value, child) {
//     for (InventoryGroup group in inventoryGroup) {
//       _listGroup.add(InventoryListGroup(group: group));
//     }

//     return Expanded(
//       child: ListView(children: _listGroup),
//     );
//   }

//   // for (InventoryGroup group in _activeGroup) {
//   //   _listGroup.add(InventoryListGroup(group: group));
//   // }

//   // return Expanded(
//   //   child: ListView(children: _listGroup),
//   // );

//   // debugPrint('hello');
//   // return Consumer<Store>(
//   //   builder: (context, store, child) {
//   //     // debugPrint('there');
//   //     debugPrint(groupName);
//   //     _locationGroup = store.locationGroups;
//   //     _alphabeticalGroup = store.locationGroups;

//   //     final _activeGroup =
//   //         (groupName == 'Location') ? _locationGroup : _alphabeticalGroup;
//   //     final List<InventoryListGroup> _listGroup = [];

//   //     debugPrint(_activeGroup[0].name);

//   //     for (InventoryGroup group in _activeGroup) {
//   //       _listGroup.add(InventoryListGroup(group: group));
//   //     }

//   //     return Expanded(
//   //       child: ListView(children: _listGroup),
//   //     );
//   //   },
//   // );
// }
