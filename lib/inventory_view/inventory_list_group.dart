import 'package:flutter/material.dart';

import 'package:pantry/models/consumable.dart';
import 'package:pantry/models/inventory_group.dart';
import 'package:pantry/app/theme.dart' as theme;

import 'inventory_list_tile.dart';

class InventoryListGroup extends StatelessWidget {
  const InventoryListGroup({Key? key, required this.group}) : super(key: key);

  final InventoryGroup group;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      child: Column(
        children: [
          _groupTitle(group.name),
          _groupBody(group.consumables),
        ],
      ),
    );
  }
}

Widget _groupTitle(String title) => Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: theme.Typography.titleSmall(theme.Light.onBackground),
      ),
    );

Widget _groupBody(List<Consumable> list) {
  final _listTiles = <Widget>[];

  for (var i = 0; i < list.length; i++) {
    final _hasDivider = i < (list.length - 1) ? true : false;
    _listTiles.add(InventoryListTile(item: list[i], hasDivider: _hasDivider));
  }

  _listTiles.removeLast();

  return Container(
    decoration: BoxDecoration(
      color: theme.Light.surface,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Column(
      children: _listTiles,
    ),
  );
}
