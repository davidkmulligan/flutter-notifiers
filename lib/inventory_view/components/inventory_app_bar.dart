import 'package:flutter/material.dart';

import 'package:pantry/app/store.dart';
import 'package:pantry/models/consumable.dart';
import 'package:pantry/app/theme.dart' as theme;

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _categoryBanner(
            activeCategory,
            updateActiveCategory,
          ),
          _addButton(context),
        ],
      ),
    );
  }
}

Widget _categoryBanner(String text, VoidCallback callback) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0),
    child: InkWell(
      onTap: callback,
      child: _text(text),
    ),
  );
}

Widget _text(String category) {
  return RichText(
    text: TextSpan(
      style: theme.Typography.headline2(theme.Palette.onBackground),
      children: [
        const TextSpan(text: 'sort by: '),
        TextSpan(
          text: category,
          style: theme.Typography.headline2(theme.Palette.primary),
        ),
      ],
    ),
  );
}

Widget _addButton(BuildContext context) {
  return IconButton(
      onPressed: () => Navigator.pushNamed(context, '/settings'),
      icon: Icon(
        Icons.tune,
        color: theme.Palette.primary,
      ));
}
