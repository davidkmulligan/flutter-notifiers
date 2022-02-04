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
    return Dismissible(
      key: Key(consumable.id),
      background: Container(
        color: theme.Palette.error,
      ),
      onDismissed: (direction) => DataStore.deleteConsumable(consumable.id),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          '/edit-consumable',
          arguments: consumable,
        ),
        child: _tile(consumable),
      ),
    );
  }
}

Widget _tile(Consumable c) {
  return Container(
    alignment: Alignment.centerLeft,
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    height: 44.0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          c.name,
          style: theme.Typography.body(theme.Palette.onBackground),
        ),
        Text(
          c.printExpiry(),
          style: theme.Typography.body(theme.Palette.onBackgroundFaded),
        )
      ],
    ),
  );
}
