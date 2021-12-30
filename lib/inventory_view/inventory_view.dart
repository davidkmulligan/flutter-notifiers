import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pantry/models/consumable.dart';
import 'package:pantry/app/theme.dart' as theme;
import 'package:pantry/app/store.dart' as store;

import 'inventory_list_group.dart';

class InventoryView extends StatelessWidget {
  const InventoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, List<Consumable>> _groups = <String, List<Consumable>>{};

    for (Consumable consumable in store.consumables) {
      if (_groups.containsKey(consumable.location)) {
        _groups[consumable.location]!.add(consumable);
      } else {
        _groups[consumable.location] = [consumable];
      }
    }

    return Scaffold(
      backgroundColor: theme.Light.background,
      appBar: _appBar(),
      body: _stackBody(_groups),
    );
  }
}

Stack _stackBody(Map<String, List<Consumable>> groups) => Stack(
      children: [
        _body(groups),
        _stackOverlay(),
      ],
    );

Widget _stackOverlay() => Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          // alignment: Alignment.bottomCenter,
          height: 48.0,

          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [theme.Light.backgroundFaded, theme.Light.background],
            ),
          ),
        ),
      ],
    );

AppBar _appBar() => AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text('Pantry',
          style: theme.Typography.display(theme.Light.onBackground)),
    );

Widget _body(Map<String, List<Consumable>> groups) {
  final _listGroups = <Widget>[];
  final _keys = groups.keys;

  for (var k in _keys) {
    _listGroups.add(InventoryListGroup(
      groupTitle: k,
      groupList: groups[k]!,
    ));
  }

  // _listGroups.add(const SizedBox(height: 24.0));

  return Column(
    children: [
      _sortBy(),
      Expanded(
        child: ListView(
          children: _listGroups,
        ),
      ),
    ],
  );
}

Widget _sortBy() => Container(
      height: 64.0,
      // color: Colors.blue[100],
      padding: const EdgeInsets.only(left: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
              style: theme.Typography.titleMedium(theme.Light.onBackground),
              children: [
                const TextSpan(text: 'Sort by: '),
                TextSpan(
                    text: 'Location',
                    style: theme.Typography.titleMedium(theme.Light.primary)),
              ]),
        ),
      ),
    );
