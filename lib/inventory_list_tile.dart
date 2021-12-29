import 'package:flutter/material.dart';

import 'theme.dart' as theme;

class InventoryListTile extends StatelessWidget {
  const InventoryListTile({Key? key, required this.itemName}) : super(key: key);

  final String itemName;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 8.0),
      height: 44.0,
      // color: Colors.pink[50],
      child: Text(
        itemName,
        style: theme.Typography.bodyMedium(theme.Light.onSurface),
      ),
    );
  }
}
