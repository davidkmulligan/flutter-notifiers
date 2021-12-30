import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pantry/app/theme.dart' as theme;
import 'package:pantry/app/store.dart' as store;
import 'package:pantry/app/miscella.dart';

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
    sortInventoryGroups();
  }

  late String _sortCategory;

  void _updateSortCategory() {
    setState(() => _sortCategory =
        (_sortCategory == 'Location') ? 'Alphabetical' : 'Location');
  }

  @override
  Widget build(BuildContext context) {
    final _groups = (_sortCategory == 'Location')
        ? store.locationGroups
        : store.alphabeticalGroups;

    return Scaffold(
      backgroundColor: theme.Light.background,
      appBar: _appBar(),
      body: Column(
        children: [
          SortByBanner(
            sortCategory: _sortCategory,
            updateSortCategory: _updateSortCategory,
          ),
          InventoryListView(groups: _groups)
        ],
      ),
    );
  }
}

AppBar _appBar() {
  return AppBar(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    title: Text('Pantry',
        style: theme.Typography.display(theme.Light.onBackground)),
  );
}
