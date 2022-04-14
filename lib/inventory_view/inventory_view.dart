import 'package:flutter/material.dart';

import 'package:pantry/models/category_group.dart';
import 'package:pantry/app/store.dart';

import 'package:pantry/inventory_view/components/inventory_app_bar.dart';
import 'package:pantry/inventory_view/components/inventory_list_group.dart';
import 'package:pantry/inventory_view/components/inventory_list_view.dart';

enum Category { location, alphabetical }

class InventoryView extends StatefulWidget {
  const InventoryView({Key? key}) : super(key: key);

  @override
  State<InventoryView> createState() => _InventoryViewState();
}

class _InventoryViewState extends State<InventoryView> {
  @override
  void initState() {
    super.initState();
    activeCategory = Category.location;

    locationListGroups = _locationListView();
    alphabeticalListGroups = _alphabeticalListView();

    activeListGroups = locationListGroups;
  }

  late Category activeCategory;
  late Widget activeListGroups;
  late Widget locationListGroups;
  late Widget alphabeticalListGroups;

  void setActiveCategory() {
    final _previouslyActive = activeCategory;
    switch (_previouslyActive) {
      case Category.location:
        setState(() {
          activeCategory = Category.alphabetical;
          activeListGroups = alphabeticalListGroups;
        });
        break;
      case Category.alphabetical:
        setState(() {
          activeCategory = Category.location;
          activeListGroups = locationListGroups;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            InventoryAppBar(
              activeCategory: activeCategory.name,
              updateActiveCategory: setActiveCategory,
            ),
            Expanded(
              child: activeListGroups,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, '/add-consumable'),
      ),
    );
  }
}

Widget _locationListView() {
  return ValueListenableBuilder(
    valueListenable: Store.locationGroups,
    builder: (context, value, child) {
      var _list = value as CategoryGroupings;
      return InventoryListView(
        inventoryGroup:
            _list.map((group) => InventoryListGroup(group: group)).toList(),
      );
    },
  );
}

Widget _alphabeticalListView() {
  return ValueListenableBuilder(
    valueListenable: Store.alphabeticalGroups,
    builder: (context, value, child) {
      var _list = value as CategoryGroupings;
      return InventoryListView(
        inventoryGroup:
            _list.map((group) => InventoryListGroup(group: group)).toList(),
      );
    },
  );
}
