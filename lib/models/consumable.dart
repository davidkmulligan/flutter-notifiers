import 'dart:math';

import 'package:uuid/uuid.dart';

class Consumable {
  Consumable(
      {required this.name, required this.location, required this.expiry}) {
    _uuid = const Uuid();
    id = _uuid.v4();
    isMarkedForDelete = false;
  }

  Consumable.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        location = json['location'],
        expiry = Expiry();

  static late Uuid _uuid;

  late String id;
  late bool isMarkedForDelete;

  String name;
  String location;
  Expiry expiry;

  String printExpiry() {
    if (expiry.year == DateTime.now().year) {
      return '${expiry.day} - ${expiry.month}';
    } else {
      return '${expiry.day} - ${expiry.month} - ${expiry.year}';
    }
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'location': location,
      };
}

class Expiry {
  Expiry({int? day, int? month, int? year}) {
    final now = DateTime.now();
    this.day = day ?? now.day;
    this.month = month ?? now.month;
    this.year = year ?? now.year;
  }
  late int day;
  late int month;
  late int year;
}
