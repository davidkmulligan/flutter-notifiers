import 'package:flutter/foundation.dart';

import 'package:pantry/models/consumable.dart';
import 'package:pantry/models/category_group.dart';

class CategoryGroupingsNotifier extends ChangeNotifier
    implements ValueListenable<CategoryGroupings> {
  CategoryGroupingsNotifier(this._groupings);

  @override
  CategoryGroupings get value => _groupings;

  CategoryGroupings _groupings;

  set value(CategoryGroupings newGroupings) {
    _groupings = newGroupings;
    notifyListeners();
  }

  void update() {
    notifyListeners();
  }

  bool doesContainGroupWithName(String name) {
    return _groupings.indexWhere((group) => group.name == name) != -1
        ? true
        : false;
  }

  void addGroup({required String name, required List<Consumable> consumables}) {
    _groupings.add(CategoryGroup(name: name, members: consumables));
  }

  void addMemberToGroup(Consumable consumable) {
    final _index =
        _groupings.indexWhere((group) => group.name == consumable.location);
    _groupings[_index].members.add(consumable);
  }
}
