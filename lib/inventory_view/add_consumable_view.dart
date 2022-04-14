import 'package:flutter/material.dart';
import 'package:pantry/inventory_view/components/edit_top_bar.dart';

import 'package:pantry/models/consumable.dart';
import 'package:pantry/app/store.dart';

// import 'package:pantry/inventory_view/components/inventory_back_button.dart';
import 'package:pantry/inventory_view/components/consumable_form.dart';

class AddConsumableView extends StatefulWidget {
  const AddConsumableView({Key? key}) : super(key: key);

  @override
  State<AddConsumableView> createState() => _AddConsumableViewState();
}

class _AddConsumableViewState extends State<AddConsumableView> {
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _locationController = TextEditingController();
  }

  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _nameController;
  late final TextEditingController _locationController;

  void validateAndAddItem() {
    if (!(_formKey.currentState!.validate())) return;

    Store.addConsumable(Consumable(
      name: _nameController.text,
      location: _locationController.text,
      expiry: Expiry(),
    ));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const EditTopBar(
              title: "Add an Item",
            ),
            ConsumableForm(
              formKey: _formKey,
              nameController: _nameController,
              locationController: _locationController,
              onSubmitCallback: validateAndAddItem,
            ),
          ],
        ),
      ),
    );
  }
}
