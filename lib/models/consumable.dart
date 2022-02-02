// import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import 'package:pantry/utils/generate_hex_id.dart';

class Consumable {
  Consumable({required this.name, required this.location}) {
    generateHexId()
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
