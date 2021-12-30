import 'consumable.dart';

class InventoryGroup {
  InventoryGroup({required this.name, required this.consumables});

  String name;
  List<Consumable> consumables;
}
