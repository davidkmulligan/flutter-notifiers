import 'package:pantry/models/consumable.dart';
import 'package:pantry/models/inventory_group.dart';

import 'store.dart' as store;

void sortInventoryGroups() {
  if (store.locationGroups.isNotEmpty) store.consumablesSource.clear();
  if (store.alphabeticalGroups.isNotEmpty) store.alphabeticalGroups.clear();

  _sortLocationGroups();
  _sortAlphabeticalGroups();
}

void _sortLocationGroups() {
  Map<String, List<Consumable>> _group = {};

  for (Consumable c in store.consumablesSource) {
    if (_group.containsKey(c.location)) {
      _group[c.location]!.add(c);
    } else {
      _group[c.location] = [c];
    }
  }

  _group.forEach((key, value) =>
      store.locationGroups.add(InventoryGroup(name: key, consumables: value)));
}

void _sortAlphabeticalGroups() {
  Map<String, List<Consumable>> _group = {};

  for (Consumable c in store.consumablesSource) {
    final _letter = c.name[0].toUpperCase();
    if (_group.containsKey(_letter)) {
      _group[_letter]!.add(c);
    } else {
      _group[_letter] = [c];
    }
  }

  _group.forEach((key, value) => store.alphabeticalGroups
      .add(InventoryGroup(name: key, consumables: value)));

  store.alphabeticalGroups.sort((a, b) => a.name.compareTo(b.name));
}
