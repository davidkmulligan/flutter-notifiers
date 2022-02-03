import 'package:uuid/uuid.dart';

class Consumable {
  Consumable({required this.name, required this.location}) {
    _uuid = const Uuid();
    id = _uuid.v4();
    isMarkedForDelete = false;
  }

  static late Uuid _uuid;

  late String id;
  late bool isMarkedForDelete;

  String name;
  String location;
}
