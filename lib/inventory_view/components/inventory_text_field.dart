import 'package:flutter/material.dart';

import 'package:pantry/app/theme.dart' as theme;

class InventoryTextField extends StatelessWidget {
  const InventoryTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.hintText = '',
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      margin: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        cursorColor: theme.Palette.primary,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12.0),
          isDense: true,
          focusColor: theme.Palette.primary,
          filled: true,
          fillColor: theme.Palette.surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          labelText: labelText,
        ),
        controller: controller,
        validator: (value) =>
            (value == null || value.isEmpty) ? 'Please ' + hintText : null,
      ),
    );
  }
}
