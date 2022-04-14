import 'consumable.dart';

typedef CategoryGroupings = List<CategoryGroup>;

class CategoryGroup {
  CategoryGroup({
    required this.name,
    required this.members,
  });

  String name;
  List<Consumable> members;
}
