import 'package:flutter/material.dart';

import 'package:pantry/models/consumable.dart';
import 'package:pantry/app/theme.dart' as theme;
import 'package:pantry/app/dataStore.dart';

class InventoryListTile extends StatelessWidget {
  const InventoryListTile({Key? key, required this.consumable})
      : super(key: key);

  final Consumable consumable;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => DataStore.updateConsumable(
          id: consumable.id,
          update: Consumable(
              name: consumable.name + 'ah', location: consumable.location)),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 8.0),
        height: 44.0,
        child: Text(
          consumable.name,
          style: theme.Typography.body(theme.Palette.onBackground),
        ),
      ),
    );
  }
}
