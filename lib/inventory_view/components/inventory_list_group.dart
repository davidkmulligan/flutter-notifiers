import 'package:flutter/material.dart';

import 'package:pantry/models/consumable.dart';
import 'package:pantry/models/inventory_group.dart';
import 'package:pantry/app/theme.dart' as theme;

import 'package:pantry/inventory_view/components/inventory_list_tile.dart';

class InventoryListGroup extends StatelessWidget {
  const InventoryListGroup({Key? key, required this.group}) : super(key: key);

  final InventoryGroup group;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
      child: Column(
        children: [
          _groupTitle(group.name),
          _groupBody(group.consumables),
        ],
      ),
    );
  }
}

Widget _groupTitle(String title) {
  return Container(
    alignment: Alignment.centerLeft,
    // padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 16.0),
    padding: const EdgeInsets.only(left: 0.0, bottom: 6.0),
    child: Text(
      title,
      style: theme.Typography.headline(theme.Palette.onBackground),
    ),
  );
}

Widget _groupBody(List<Consumable> consumables) {
  return Container(
    decoration: BoxDecoration(
      color: theme.Palette.surface,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Column(
      children:
          // consumables.map((c) => InventoryListTile(consumable: c)).toList(),
          _listTiles(consumables),
    ),
  );
}

List<Widget> _listTiles(List<Consumable> consumables) {
  final List<Widget> listTiles = [];

  for (var c in consumables) {
    listTiles.add(InventoryListTile(consumable: c));
    listTiles.add(const Divider(
      indent: 16.0,
      endIndent: 2.0,
      height: 0.0,
      color: Color.fromARGB(132, 158, 158, 158),
    ));
  }

  listTiles.removeLast();
  return listTiles;
}
