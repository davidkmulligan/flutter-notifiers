import 'package:flutter/material.dart';
import 'package:pantry/inventory_view/components/inventory_back_button.dart';

class EditTopBar extends StatelessWidget {
  const EditTopBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        const InventoryBackButton(),
        Align(
          alignment: Alignment.centerRight,
          child: Text(title),
        ),
      ],
    );
  }
}
