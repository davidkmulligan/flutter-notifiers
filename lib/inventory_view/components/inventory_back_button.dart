import 'package:flutter/material.dart';

import 'package:pantry/app/theme.dart' as theme;

class InventoryBackButton extends StatelessWidget {
  const InventoryBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: theme.Palette.onBackground),
        ),
      ),
    );
  }
}
