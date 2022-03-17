import 'package:flutter/material.dart';
import 'package:pantry/app/dataStore.dart';
import 'package:pantry/inventory_view/components/inventory_back_button.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const InventoryBackButton(),
        title: const Text('Settings'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          ElevatedButton(
            onPressed: DataStore.readFromDisk,
            child: Text('Load inventory'),
          ),
          ElevatedButton(
            onPressed: DataStore.clearStore,
            child: Text('Delete inventory'),
          )
        ],
      ),
    );
  }
}
