import 'package:flutter/material.dart';
import 'package:pantry/inventory_view/components/edit_top_bar.dart';

import 'package:pantry/models/consumable.dart';
import 'package:pantry/app/dataStore.dart';

import 'package:pantry/inventory_view/components/inventory_back_button.dart';
import 'package:pantry/inventory_view/components/consumable_form.dart';

class EditConsumableView extends StatefulWidget {
  const EditConsumableView({Key? key}) : super(key: key);

  @override
  State<EditConsumableView> createState() => _EditConsumableViewState();
}

class _EditConsumableViewState extends State<EditConsumableView> {
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _locationController = TextEditingController();
  }

  late final Consumable consumable;

  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _nameController;
  late final TextEditingController _locationController;

  void validateAndUpdateItem() {
    if (!(_formKey.currentState!.validate())) return;

    consumable.name = _nameController.text;
    consumable.location = _locationController.text;

    DataStore.updateConsumable(id: consumable.id, update: consumable);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    consumable = ModalRoute.of(context)!.settings.arguments as Consumable;

    _nameController.text = consumable.name;
    _locationController.text = consumable.location;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const EditTopBar(
              title: "Edit an Item",
            ),
            ConsumableForm(
              formKey: _formKey,
              nameController: _nameController,
              locationController: _locationController,
              onSubmitCallback: validateAndUpdateItem,
            ),
          ],
        ),
      ),
    );
  }
}
