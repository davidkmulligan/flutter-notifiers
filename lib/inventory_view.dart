import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'inventory_list_group.dart';

class InventoryView extends StatelessWidget {
  const InventoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }
}

AppBar _appBar() => AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.blue[50],
      elevation: 0.0,
      title: const Text('boo', style: TextStyle(color: Colors.black)),
    );

Widget _body() => Column(
      children: [
        _sortBy(),
        Expanded(
          child: ListView(
            children: const [
              InventoryListGroup(),
              InventoryListGroup(),
              InventoryListGroup(),
              InventoryListGroup(),
              InventoryListGroup(),
              InventoryListGroup(),
              InventoryListGroup(),
            ],
          ),
        ),
      ],
    );

Widget _sortBy() => Container(
      height: 64.0,
      // color: Colors.blue[100],
      padding: const EdgeInsets.only(left: 16.0),
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Sort by: Alphabetical',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
