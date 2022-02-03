import 'package:flutter/material.dart';

import 'package:pantry/test_data.dart' as test;

import 'package:pantry/models/consumable.dart';
import 'package:pantry/models/inventory_group.dart';
import 'package:pantry/models/inventory_group_collection.dart';

class Store {
  static init() {
    consumablesSource = ValueNotifier(test.sourceConsumables);

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
