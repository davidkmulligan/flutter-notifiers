import 'package:pantry/test_data.dart' as test;

import 'package:pantry/models/consumable.dart';
import 'package:pantry/models/inventory_group_collection.dart';

class DataStore {
  DataStore() {
    consumableSource = test.sourceConsumables;
    locationGroups = InventoryGroupCollection([]);
    alphabeticalGroups = InventoryGroupCollection([]);
  }

  static late List<Consumable> consumableSource;
  static late InventoryGroupCollection locationGroups;
  static late InventoryGroupCollection alphabeticalGroups;

  static void sortInventoryGroupsFromSource() {
    locationGroups.value.clear();
    alphabeticalGroups.value.clear();

    for (Consumable item in consumableSource) {
      if (locationGroups.doesContainGroupWithName(item.location)) {
        locationGroups.addToGroupWithName(
            name: item.location, consumable: item);
      } else {
        locationGroups.addGroup(name: item.location, consumables: [item]);
      }

      final _firstLetter = item.name[0].toUpperCase();
      if (alphabeticalGroups.doesContainGroupWithName(_firstLetter)) {
        alphabeticalGroups.addToGroupWithName(
            name: _firstLetter, consumable: item);
      } else {
        alphabeticalGroups.addGroup(name: _firstLetter, consumables: [item]);
      }

      alphabeticalGroups.value.sort((a, b) => a.name.compareTo(b.name));
    }
  }

  static void addConsumable(Consumable consumable) {
    consumableSource.add(consumable);

    if (locationGroups.doesContainGroupWithName(consumable.location)) {
      locationGroups.addToGroupWithName(
          name: consumable.location, consumable: consumable);
    } else {
      locationGroups
          .addGroup(name: consumable.location, consumables: [consumable]);
    }

    final _firstLetter = consumable.name[0].toUpperCase();
    if (alphabeticalGroups.doesContainGroupWithName(_firstLetter)) {
      alphabeticalGroups.addToGroupWithName(
          name: _firstLetter, consumable: consumable);
    } else {
      alphabeticalGroups
          .addGroup(name: _firstLetter, consumables: [consumable]);
    }

    alphabeticalGroups.value.sort((a, b) => a.name.compareTo(b.name));

    locationGroups.update();
    alphabeticalGroups.update();
  }

  static void updateConsumable(
      {required String id, required Consumable update}) {
    final index = consumableSource.indexWhere((element) => element.id == id);
    consumableSource[index] = update;

    sortInventoryGroupsFromSource();

    locationGroups.update();
    alphabeticalGroups.update();
  }

  static void deleteConsumable(String id) {
    // final index = consumableSource.indexWhere((element) => element.id == id);
    // final consumable = consumableSource[index];

    consumableSource.removeWhere((c) => c.id == id);

    sortInventoryGroupsFromSource();

    // final locationIndex = locationGroups.value
    //     .indexWhere((element) => element.name == consumable.location);

    // locationGroups.value[locationIndex].consumables
    //     .removeWhere((element) => element.id == id);

    // if (locationGroups.value[locationIndex].consumables.isEmpty) {
    //   locationGroups.value.removeAt(locationIndex);
    // }

    // final alphaIndex = alphabeticalGroups.value
    //     .indexWhere((element) => element.name == consumable.location);

    // alphabeticalGroups.value[alphaIndex].consumables
    //     .removeWhere((element) => element.id == id);

    // if (alphabeticalGroups.value[alphaIndex].consumables.isEmpty) {
    //   alphabeticalGroups.value.removeAt(alphaIndex);
    // }

    locationGroups.update();
    alphabeticalGroups.update();
  }
}
