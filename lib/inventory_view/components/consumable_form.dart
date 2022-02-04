import 'package:flutter/material.dart';

import 'package:pantry/app/theme.dart' as theme;

import 'package:pantry/inventory_view/components/inventory_text_field.dart';

class ConsumableForm extends StatelessWidget {
  const ConsumableForm({
    Key? key,
    required this.formKey,
    required this.nameController,
    required this.locationController,
    required this.onSubmitCallback,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController locationController;
  final VoidCallback onSubmitCallback;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 24.0),
          InventoryTextField(
            controller: nameController,
            hintText: 'Add a name',
          ),
          InventoryTextField(
            controller: locationController,
            hintText: 'add a location',
          ),
          _submitButton(onSubmitCallback),
        ],
      ),
    );
  }
}

Widget _submitButton(VoidCallback submit) {
  return OutlinedButton(
    onPressed: submit,
    style: OutlinedButton.styleFrom(
      side: BorderSide(width: 1.0, color: theme.Palette.primary),
    ),
    child: Text(
      'Add item',
      style: theme.Typography.label(theme.Palette.primary),
    ),
  );
}
