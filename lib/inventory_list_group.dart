import 'package:flutter/material.dart';
import 'package:pantry/consumable.dart';

import 'theme.dart' as theme;

import 'inventory_list_tile.dart';

class InventoryListGroup extends StatelessWidget {
  const InventoryListGroup(
      {required this.groupTitle, required this.groupList, Key? key})
      : super(key: key);

  final String groupTitle;
  final List<Consumable> groupList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      // width:
      //     MediaQuery.of(context).size.width - 16.0, // 8px padding on each side
      // color: Colors.pink[900],
      child: Column(
        children: [
          _groupTitle(groupTitle),
          _groupBody(groupList),
        ],
      ),
    );
  }
}

Widget _groupTitle(String title) => Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(8.0),
      // padding: const EdgeInsets.symmetric(vertical: 8.0),
      // color: Colors.pink[700],
      child: Text(
        title,
        style: theme.Typography.titleSmall(theme.Light.onBackground),
      ),
    );

Widget _groupBody(List<Consumable> list) {
  final _listTiles = <Widget>[];

  for (Consumable c in list) {
    _listTiles.add(InventoryListTile(itemName: c.name));
    _listTiles.add(Divider(
      indent: 8.0,
      height: 1.0,
      color: theme.Light.onSurfaceAccent,
    ));
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
