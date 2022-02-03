// import 'package:flutter/material.dart';

// import 'package:pantry/app/dataStore.dart';

// class WidgetStore {
//   WidgetStore() {
//     locationGroupListTiles = [];
//   }

//   static late List<Widget> locationGroupListTiles;

//   static void createFromSource() {
//     locationGroupListTiles.clear();

//     for (var item in DataStore.locationGroups.value) {
//       locationGroupListTiles.add(Text(
//         item.name,
//         style: TextStyle(color: Colors.deepPurple),
//       ));
//       locationGroupListTiles.addAll(item.consumables.map((e) => Text(
//             e.name,
//             style: TextStyle(color: Colors.blue),
//           )));
//     }
//   }
// }
