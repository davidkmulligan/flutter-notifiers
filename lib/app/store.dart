import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pantry/test_data.dart' as test;

import 'package:pantry/utils/local_storage.dart';
import 'package:pantry/models/consumable.dart';
import 'package:pantry/notifiers/category_groupings_notifier.dart';

class Store {
  Store() {
    consumableSource = [];
    locationGroups = CategoryGroupingsNotifier([]);
    alphabeticalGroups = CategoryGroupingsNotifier([]);
  }

  // DataStore.fromJSON(String json) {

  // }

  static late List<Consumable> consumableSource;
  static late CategoryGroupingsNotifier locationGroups;
  static late CategoryGroupingsNotifier alphabeticalGroups;

  static void sortInventoryGroupsFromSource() {
    locationGroups.value.clear();
    alphabeticalGroups.value.clear();

    for (Consumable item in consumableSource) {
      if (locationGroups.doesContainGroupWithName(item.location)) {
        locationGroups.addMemberToGroup(item);
      } else {
        locationGroups.addGroup(name: item.location, consumables: [item]);
      }

      final _firstLetter = item.name[0].toUpperCase();
      if (alphabeticalGroups.doesContainGroupWithName(_firstLetter)) {
        alphabeticalGroups.addMemberToGroup(item);
      } else {
        alphabeticalGroups.addGroup(name: _firstLetter, consumables: [item]);
      }

      alphabeticalGroups.value.sort((a, b) => a.name.compareTo(b.name));
    }
  }

  static void addConsumable(Consumable consumable) {
    consumableSource.add(consumable);

    if (locationGroups.doesContainGroupWithName(consumable.location)) {
      locationGroups.addMemberToGroup(consumable);
    } else {
      locationGroups
          .addGroup(name: consumable.location, consumables: [consumable]);
    }

    final _firstLetter = consumable.name[0].toUpperCase();
    if (alphabeticalGroups.doesContainGroupWithName(_firstLetter)) {
      alphabeticalGroups.addMemberToGroup(consumable);
    } else {
      alphabeticalGroups
          .addGroup(name: _firstLetter, consumables: [consumable]);
    }

    alphabeticalGroups.value.sort((a, b) => a.name.compareTo(b.name));

    locationGroups.update();
    alphabeticalGroups.update();
  }

  static Consumable getConsumableById(String id) {
    return consumableSource.singleWhere((c) => c.id == id);
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

  static Future<void> readFromDisk() async {
    final fileContents = await readFromLocalStorage();
    // debugPrint(fileContents);
    final Iterable json = jsonDecode(fileContents);

    consumableSource =
        List<Consumable>.from(json.map(((e) => Consumable.fromJson(e))));

    debugPrint(consumableSource.toString());
    sortInventoryGroupsFromSource();

    locationGroups.update();
    alphabeticalGroups.update();
  }

  static void saveToDisk() async {
    final _json = jsonEncode(Store.consumableSource);
    await writeToLocalStorage(_json);
  }

  static void saveTestToDisk() async {
    final _json = jsonEncode(test.sourceConsumables);
    await writeToLocalStorage(_json);
  }

  static void clearStore() {
    consumableSource.clear();
    locationGroups.value.clear();
    alphabeticalGroups.value.clear();

    locationGroups.update();
    alphabeticalGroups.update();
  }
}
