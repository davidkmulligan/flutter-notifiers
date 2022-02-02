import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pantry/models/consumable.dart';

import 'package:pantry/app/theme.dart' as theme;
import 'package:pantry/app/store.dart';

class AddConsumableView extends StatefulWidget {
  const AddConsumableView({Key? key}) : super(key: key);

  @override
  State<AddConsumableView> createState() => _AddConsumableViewState();
}

class _AddConsumableViewState extends State<AddConsumableView> {
  final _formKey = GlobalKey<FormState>();
  final _nameFieldController = TextEditingController();
  final _locationFieldController = TextEditingController();

  String _getNameFieldValue() {
    return _nameFieldController.text;
  }

  String _getLocationFieldValue() {
    return _locationFieldController.text;
  }

  @override
  void dispose() {
    _nameFieldController.dispose();
    _locationFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _appBar(context),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            _nameField(_nameFieldController),
            _locationField(_locationFieldController),
            _submitButton(
                context, _formKey, _getNameFieldValue, _getLocationFieldValue),
          ],
        ),
      ),
    );
  }
}

AppBar _appBar(BuildContext context) {
  return AppBar(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    actions: [
      IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          Icons.cancel_outlined,
          color: theme.Light.onBackground,
        ),
      ),
    ],
  );
}

Widget _nameField(TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: TextFormField(
      autofocus: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12.0),
        isDense: true,
        focusColor: theme.Light.primary,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: theme.Light.outline,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: theme.Light.primary,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
        hintText: 'Add a name',
      ),
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please add a name';
        }
        return null;
      },
    ),
  );
}

Widget _locationField(TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: TextFormField(
      // autofocus: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12.0),
        isDense: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: theme.Light.primary,
            width: 2.0,
            style: BorderStyle.solid,
          ),
        ),
        hintText: 'Add a name',
      ),
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please add a name';
        }
        return null;
      },
    ),
  );
}

ElevatedButton _submitButton(
    BuildContext context,
    GlobalKey<FormState> key,
    String Function() getNameFieldValue,
    String Function() getLocationFieldValue) {
  return ElevatedButton(
    onPressed: () {
      if (key.currentState!.validate()) {
        final String _nameFildValue = getNameFieldValue();
        final String _locationFieldValue = getLocationFieldValue();
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //       content: Text(
        //           'name: $_nameFildValue, locaiton: $_locationFieldValue')),
        // );
        Store.addConsumable(
            Consumable(name: _nameFildValue, location: _locationFieldValue));
        Navigator.pop(context);
      }
    },
    child: Text(
      'Add',
      style: theme.Typography.labelMedium(theme.Light.onBackground),
    ),
  );
}
