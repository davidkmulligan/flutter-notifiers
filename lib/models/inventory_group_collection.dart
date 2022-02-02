import 'package:flutter/foundation.dart';
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

  update() {
    notifyListeners();
  }

  @override
  String toString() => '${describeIdentity(this)}($value)';
}
