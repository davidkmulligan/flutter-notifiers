// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:pantry/models/consumable.dart';
// // import 'package:provider/provider.dart';

// import 'package:pantry/app/theme.dart' as theme;
// import 'package:pantry/app/store.dart';
// import 'package:pantry/models/inventory_group.dart';
// import 'package:pantry/models/inventory_group_collection.dart';
// // import 'package:pantry/app/miscella.dart';

// import 'sort_by_banner.dart';
// import 'inventory_list_view.dart';

import 'package:flutter/material.dart';

import 'package:pantry/models/inventory_group.dart';
import 'package:pantry/app/dataStore.dart';

import 'package:pantry/inventory_view/components/inventory_app_bar.dart';
import 'package:pantry/inventory_view/components/inventory_list_group.dart';
import 'package:pantry/inventory_view/components/inventory_list_view.dart';

enum Category { location, alphabetical }

class InventoryView extends StatefulWidget {
  const InventoryView({Key? key}) : super(key: key);

  @override
  State<InventoryView> createState() => _InventoryViewState();
}

class _InventoryViewState extends State<InventoryView> {
  @override
  void initState() {
    super.initState();
    activeCategory = Category.location;

    locationListGroups = _locationListView();
    alphabeticalListGroups = _alphabeticalListView();

    activeListGroups = locationListGroups;
  }

  late Category activeCategory;
  late Widget activeListGroups;
  late Widget locationListGroups;
  late Widget alphabeticalListGroups;

  void setActiveCategory() {
    final _previouslyActive = activeCategory;
    switch (_previouslyActive) {
      case Category.location:
        setState(() {
          activeCategory = Category.alphabetical;
          activeListGroups = alphabeticalListGroups;
        });
        break;
      case Category.alphabetical:
        setState(() {
          activeCategory = Category.location;
          activeListGroups = locationListGroups;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            InventoryAppBar(
              activeCategory: activeCategory.name,
              updateActiveCategory: setActiveCategory,
            ),
            Expanded(
              child: activeListGroups,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _locationListView() {
  return ValueListenableBuilder(
    valueListenable: DataStore.locationGroups,
    builder: (context, value, child) {
      var _list = value as List<InventoryGroup>;
      return InventoryListView(
        inventoryGroup:
            _list.map((group) => InventoryListGroup(group: group)).toList(),
      );
    },
  );
}

Widget _alphabeticalListView() {
  return ValueListenableBuilder(
    valueListenable: DataStore.alphabeticalGroups,
    builder: (context, value, child) {
      var _list = value as List<InventoryGroup>;
      return InventoryListView(
        inventoryGroup:
            _list.map((group) => InventoryListGroup(group: group)).toList(),
      );
    },
  );
}



// class InventoryView extends StatefulWidget {
//   const InventoryView({Key? key}) : super(key: key);

//   @override
//   State<InventoryView> createState() => _InventoryViewState();
// }

// class _InventoryViewState extends State<InventoryView> {
//   @override
//   void initState() {
//     super.initState();
//     _sortCategory = 'Location';
//   }

//   late String _sortCategory;

//   void _updateSortCategory() {
//     setState(() => _sortCategory =
//         (_sortCategory == 'Location') ? 'Alphabetical' : 'Location');
//   }

//   @override
//   Widget build(BuildContext context) {
//     final _activeValueListenable = (_sortCategory == 'Location')
//         ? Store.locationGroups
//         : Store.alphabeticalGroups;

//     return Scaffold(
//       backgroundColor: theme.Light.background,
//       // appBar: _appBar(context, _sortCategory, _updateSortCategory),
//       body: SafeArea(
//         child: Column(
//           children: [
//             IconButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, 'add consumable');
//                 // Store.addConsumable(Consumable(name: 'hello', location: 'Bread bin'));
//               },
//               icon: Icon(
//                 Icons.add_circle_outline,
//                 color: theme.Light.primary,
//               ),
//             ),
//             SortByBanner(
//               sortCategory: _sortCategory,
//               updateSortCategory: _updateSortCategory,
//             ),
//             ValueListenableBuilder(
//               valueListenable: _activeValueListenable,
//               builder: (context, List<InventoryGroup> value, child) {
//                 return InventoryListView(inventoryGroup: value);
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// AppBar _appBar(BuildContext context, String category, VoidCallback update) {
//   return AppBar(
//     systemOverlayStyle: SystemUiOverlayStyle.dark,
//     backgroundColor: Colors.transparent,
//     elevation: 0.0,
//     // leading: IconButton(
//     //   onPressed: () {},
//     //   icon: Icon(
//     //     Icons.search_sharp,
//     //     color: theme.Light.primary,
//     //   ),
//     // ),
//     title: Align(
//       alignment: Alignment.centerLeft,
//       child: SortByBanner(
//         sortCategory: category,
//         updateSortCategory: update,
//       ),
//     ),
//     actions: [
//       // Align(
//       //   alignment: Alignment.centerLeft,
//       //   child: SortByBanner(
//       //     sortCategory: category,
//       //     updateSortCategory: update,
//       //   ),
//       // ),
//       IconButton(
//         onPressed: () {
//           Navigator.pushNamed(context, 'add consumable');
//           // Store.addConsumable(Consumable(name: 'hello', location: 'Bread bin'));
//         },
//         icon: Icon(
//           Icons.add_circle_outline,
//           color: theme.Light.primary,
//         ),
//       ),
//     ],
//   );
// }
