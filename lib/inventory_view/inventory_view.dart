import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pantry/models/consumable.dart';
// import 'package:provider/provider.dart';

import 'package:pantry/app/theme.dart' as theme;
import 'package:pantry/app/store.dart';
import 'package:pantry/models/inventory_group.dart';
import 'package:pantry/models/inventory_group_collection.dart';
// import 'package:pantry/app/miscella.dart';

import 'sort_by_banner.dart';
import 'inventory_list_view.dart';

class InventoryView extends StatefulWidget {
  const InventoryView({Key? key}) : super(key: key);

  @override
  State<InventoryView> createState() => _InventoryViewState();
}

class _InventoryViewState extends State<InventoryView> {
  @override
  void initState() {
    super.initState();
    _sortCategory = 'Location';
  }

  late String _sortCategory;

  void _updateSortCategory() {
    setState(() => _sortCategory =
        (_sortCategory == 'Location') ? 'Alphabetical' : 'Location');
  }

  @override
  Widget build(BuildContext context) {
    final _activeValueListenable = (_sortCategory == 'Location')
        ? Store.locationGroups
        : Store.alphabeticalGroups;
    // Provider.of<Store>(context).sortInventoryGroups();

    // final _groups = (_sortCategory == 'Location')
    //     ? Provider.of<Store>(context, listen: true).locationGroups
    //     : Provider.of<Store>(context, listen: true).alphabeticalGroups;

    return Scaffold(
      backgroundColor: theme.Light.background,
      // appBar: _appBar(context, _sortCategory, _updateSortCategory),
      body: SafeArea(
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'add consumable');
                // Store.addConsumable(Consumable(name: 'hello', location: 'Bread bin'));
              },
              icon: Icon(
                Icons.add_circle_outline,
                color: theme.Light.primary,
              ),
            ),
            SortByBanner(
              sortCategory: _sortCategory,
              updateSortCategory: _updateSortCategory,
            ),
            ValueListenableBuilder(
              valueListenable: _activeValueListenable,
              builder: (context, List<InventoryGroup> value, child) {
                return InventoryListView(inventoryGroup: value);
              },
            )
          ],
        ),
      ),
    );
  }
}

AppBar _appBar(BuildContext context, String category, VoidCallback update) {
  return AppBar(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    // leading: IconButton(
    //   onPressed: () {},
    //   icon: Icon(
    //     Icons.search_sharp,
    //     color: theme.Light.primary,
    //   ),
    // ),
    title: Align(
      alignment: Alignment.centerLeft,
      child: SortByBanner(
        sortCategory: category,
        updateSortCategory: update,
      ),
    ),
    actions: [
      // Align(
      //   alignment: Alignment.centerLeft,
      //   child: SortByBanner(
      //     sortCategory: category,
      //     updateSortCategory: update,
      //   ),
      // ),
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, 'add consumable');
          // Store.addConsumable(Consumable(name: 'hello', location: 'Bread bin'));
        },
        icon: Icon(
          Icons.add_circle_outline,
          color: theme.Light.primary,
        ),
      ),
    ],
  );
}
