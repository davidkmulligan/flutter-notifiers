import 'package:flutter/material.dart';

import 'inventory_list_tile.dart';

class InventoryListGroup extends StatelessWidget {
  const InventoryListGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
      // width:
      //     MediaQuery.of(context).size.width - 16.0, // 8px padding on each side
      // color: Colors.pink[900],
      child: Column(
        children: [
          _groupTitle('Group Name'),
          _groupBody(),
        ],
      ),
    );
  }
}

Widget _groupTitle(String title) => Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(8.0),
      // color: Colors.pink[700],
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

Widget _groupBody() => Container(
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: const [
          InventoryListTile(itemName: 'item'),
          InventoryListTile(itemName: 'item'),
        ],
      ),
    );
