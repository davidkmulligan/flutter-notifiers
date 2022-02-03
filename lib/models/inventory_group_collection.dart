import 'package:flutter/foundation.dart';

import 'package:pantry/models/consumable.dart';
import 'package:pantry/models/inventory_group.dart';

class InventoryGroupCollection extends ChangeNotifier
    implements ValueListenable<List<InventoryGroup>> {
  InventoryGroupCollection(this._groups);

  @override
  List<InventoryGroup> get value => _groups;

  List<InventoryGroup> _groups;

  set value(List<InventoryGroup> newValue) {
    _groups = newValue;
    notifyListeners();
  }

  void update() {
    notifyListeners();
  }

  @override
  String toString() => '${describeIdentity(this)}($value)';

  bool doesContainGroupWithName(String name) {
    return _groups.indexWhere((group) => group.name == name) != -1
        ? true
        : false;
  }

  void addGroup({required String name, required List<Consumable> consumables}) {
    _groups.add(InventoryGroup(name: name, consumables: consumables));
  }

  void addToGroupWithName(
      {required String name, required Consumable consumable}) {
    final _index = _groups.indexWhere((group) => group.name == name);
    _groups[_index].consumables.add(consumable);
  }
}
