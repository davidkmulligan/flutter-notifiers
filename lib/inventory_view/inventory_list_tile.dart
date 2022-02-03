// import 'dart:async';

// import 'package:flutter/material.dart';

// import 'package:pantry/app/theme.dart' as theme;
// import 'package:pantry/app/store.dart';
// import 'package:pantry/models/consumable.dart';

// class InventoryListTile extends StatelessWidget {
//   const InventoryListTile(
//       {Key? key, required this.item, required this.hasDivider})
//       : super(key: key);

//   final Consumable item;
//   final bool hasDivider;

//   @override
//   Widget build(BuildContext context) {
//     return Dismissible(
//       key: Key(item.id),
//       onDismissed: (direction) {
//         Store.markConsumableForDelete(id: item.id);
//         final _sbKey = 'sb_' + item.id;
//         Timer(const Duration(seconds: 4), () {
//           ScaffoldMessenger.of(context).removeCurrentSnackBar();
//           print('bye');
//           Store.deleteConsumable(id: item.id);
//         });

//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           key: Key(_sbKey),
//           content: Text('${item.id} was marked for delete'),
//           // duration: const Duration(seconds: 3),
//           action: SnackBarAction(
//             label: 'Undo',
//             onPressed: () => Store.unMarkConsumableForDelete(id: item.id),
//           ),
//         ));
//       },
//       child: hasDivider
//           ? Column(
//               children: [
//                 Container(
//                   alignment: Alignment.centerLeft,
//                   padding: const EdgeInsets.only(left: 8.0),
//                   height: 44.0,
//                   child: Text(
//                     item.name,
//                     style: theme.Typography.bodyMedium(theme.Light.onSurface),
//                   ),
//                 ),
//                 Divider(
//                   indent: 8.0,
//                   height: 1.0,
//                   color: theme.Light.onSurfaceAccent,
//                 )
//               ],
//             )
//           : Container(
//               alignment: Alignment.centerLeft,
//               padding: const EdgeInsets.only(left: 8.0),
//               height: 44.0,
//               child: Text(
//                 item.name,
//                 style: theme.Typography.bodyMedium(theme.Light.onSurface),
//               ),
//             ),
//     );
//   }
// }
