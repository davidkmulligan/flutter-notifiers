import 'dart:math';

import 'package:flutter/material.dart';

import 'package:pantry/app/dataStore.dart';
import 'package:pantry/models/consumable.dart';

class InventoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const InventoryAppBar({
    Key? key,
    required this.activeCategory,
    required this.updateActiveCategory,
  }) : super(key: key);

  final String activeCategory;
  final VoidCallback updateActiveCategory;

  @override
  final Size preferredSize = const Size.fromHeight(64.0);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _categoryBanner(
          activeCategory,
          updateActiveCategory,
        ),
        _addButton(),
        _deleteButton(),
      ],
    );
  }
}

Widget _categoryBanner(String text, VoidCallback callback) {
  return InkWell(
    onTap: callback,
    child: Text(text),
  );
}

Widget _addButton() {
  return IconButton(
      onPressed: () => DataStore.addConsumable(
          Consumable(name: 'name', location: 'location')),
      icon: const Icon(Icons.add_circle_outline));
}

Widget _deleteButton() {
  return IconButton(onPressed: _delete, icon: const Icon(Icons.block_outlined));
}

void _delete() {
  final random = Random();
  final index = random.nextInt(DataStore.consumableSource.length);
  final id = DataStore.consumableSource[index].id;
  DataStore.deleteConsumable(id);
}
