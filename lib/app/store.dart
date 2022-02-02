import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import 'package:pantry/models/consumable.dart';
import 'package:pantry/models/inventory_group.dart';
import 'package:pantry/models/inventory_group_collection.dart';

// import 'miscella.dart';

class Store {
  static init() {
    consumablesSource = ValueNotifier(_sourceConsumables);

    locationGroups = InventoryGroupCollection([]);
    alphabeticalGroups = InventoryGroupCollection([]);
  }

  static late ValueNotifier<List<Consumable>> consumablesSource;

  static late InventoryGroupCollection locationGroups;
  static late InventoryGroupCollection alphabeticalGroups;

  static void sortInventoryGroups() {
    if (locationGroups.value.isNotEmpty) locationGroups.value.clear();
    if (alphabeticalGroups.value.isNotEmpty) alphabeticalGroups.value.clear();

    final Map<String, List<Consumable>> _locationGroups = {};
    final Map<String, List<Consumable>> _alphabeticalGroups = {};

    for (Consumable item in consumablesSource.value) {
      // get all Location groups
      if (_locationGroups.containsKey(item.location)) {
        _locationGroups[item.location]!.add(item);
      } else {
        _locationGroups[item.location] = [item];
      }

      // get all Alphabetical groups
      final _firstLetter = item.name[0].toUpperCase();
      if (_alphabeticalGroups.containsKey(_firstLetter)) {
        _alphabeticalGroups[_firstLetter]!.add(item);
      } else {
        _alphabeticalGroups[_firstLetter] = [item];
      }
    }

    _locationGroups.forEach((groupName, groupItems) => locationGroups.value
        .add(InventoryGroup(name: groupName, consumables: groupItems)));

    _alphabeticalGroups.forEach((groupName, groupItems) => alphabeticalGroups
        .value
        .add(InventoryGroup(name: groupName, consumables: groupItems)));

    alphabeticalGroups.value.sort((a, b) => a.name.compareTo(b.name));
  }

  static addConsumable(Consumable consumable) {
    consumablesSource.value.add(consumable);
    sortInventoryGroups();
    locationGroups.update();
    alphabeticalGroups.update();
    // locationGroups.notifyListeners();
    // alphabeticalGroups.notifyListeners();
  }

  static markConsumableForDelete({required String id}) {
    final _index =
        consumablesSource.value.indexWhere((element) => element.id == id);
    consumablesSource.value[_index].isMarkedForDelete = true;
    debugPrint('marked for delete');
  }

  static unMarkConsumableForDelete({required String id}) {
    final _index =
        consumablesSource.value.indexWhere((element) => element.id == id);
    consumablesSource.value[_index].isMarkedForDelete = false;
    debugPrint('unMarked for delete');
  }

  static deleteConsumable({required String id}) {
    consumablesSource.value.removeWhere((element) => element.id == id);
    sortInventoryGroups();
    locationGroups.update();
    alphabeticalGroups.update();
  }
}

// class Store extends ChangeNotifier {
//   Store() {
//     consumablesSource.addAll(_sourceConsumables);
//   }

//   void notify() {
//     notifyListeners();
//   }

//   void sortInventoryGroups() {
//     if (locationGroups.isNotEmpty) locationGroups.clear();
//     if (alphabeticalGroups.isNotEmpty) alphabeticalGroups.clear();

//     final Map<String, List<Consumable>> _locationGroups = {};
//     final Map<String, List<Consumable>> _alphabeticalGroups = {};

//     for (Consumable item in consumablesSource) {
//       // get all Location groups
//       if (_locationGroups.containsKey(item.location)) {
//         _locationGroups[item.location]!.add(item);
//       } else {
//         _locationGroups[item.location] = [item];
//       }

//       // get all Alphabetical groups
//       final _firstLetter = item.name[0].toUpperCase();
//       if (_alphabeticalGroups.containsKey(_firstLetter)) {
//         _alphabeticalGroups[_firstLetter]!.add(item);
//       } else {
//         _alphabeticalGroups[_firstLetter] = [item];
//       }
//     }

//     _locationGroups.forEach((groupName, groupItems) => locationGroups
//         .add(InventoryGroup(name: groupName, consumables: groupItems)));

//     _alphabeticalGroups.forEach((groupName, groupItems) => alphabeticalGroups
//         .add(InventoryGroup(name: groupName, consumables: groupItems)));

//     alphabeticalGroups.sort((a, b) => a.name.compareTo(b.name));
//   }

//   void addConsumable(Consumable consumable) {
//     consumablesSource.add(consumable);

//     final _locationGroupIndex =
//         locationGroups.indexWhere((group) => group.name == consumable.location);

//     if (_locationGroupIndex != -1) {
//       locationGroups[_locationGroupIndex].consumables.add(consumable);
//     } else {
//       locationGroups.add(
//           InventoryGroup(name: consumable.location, consumables: [consumable]));
//     }

//     final _firstLetter = consumable.name[0].toUpperCase();
//     final _alphabeticalGroupIndex =
//         alphabeticalGroups.indexWhere((group) => group.name == _firstLetter);

//     if (_alphabeticalGroupIndex != -1) {
//       alphabeticalGroups[_alphabeticalGroupIndex].consumables.add(consumable);
//     } else {
//       alphabeticalGroups
//           .add(InventoryGroup(name: _firstLetter, consumables: [consumable]));

//       alphabeticalGroups.sort((a, b) => a.name.compareTo(b.name));
//     }

//     notifyListeners();
//   }

//   List<Consumable> consumablesSource = [];

//   List<InventoryGroup> locationGroups = [];
//   List<InventoryGroup> alphabeticalGroups = [];
// }

// test data
List<Consumable> _sourceConsumables = [
  Consumable(name: 'bread', location: 'Bread bin'),
  Consumable(name: 'coke', location: 'Fridge'),
  Consumable(name: 'coke', location: 'Fridge'),
  Consumable(name: 'coke', location: 'Fridge'),
  Consumable(name: 'butter', location: 'Fridge'),
  Consumable(name: 'pizza', location: 'Freezer'),
  Consumable(name: 'biscuits', location: 'Bread bin'),
  Consumable(name: 'english breakfast tea', location: 'Press'),
  Consumable(name: 'rice', location: 'Press'),
  Consumable(name: 'pasta', location: 'Press'),
  Consumable(name: 'apple', location: 'Fruit bowl'),
  Consumable(name: 'orange', location: 'Fruit bowl'),
];
