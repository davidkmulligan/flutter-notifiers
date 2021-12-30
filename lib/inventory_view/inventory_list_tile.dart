import 'package:flutter/material.dart';

import 'package:pantry/app/theme.dart' as theme;

class InventoryListTile extends StatelessWidget {
  const InventoryListTile({Key? key, required this.itemName}) : super(key: key);

  final String itemName;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 8.0),
      height: 44.0,
      child: Text(
        itemName,
        style: theme.Typography.bodyMedium(theme.Light.onSurface),
      ),
    );
  }
}
