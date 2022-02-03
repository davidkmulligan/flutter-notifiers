import 'package:pantry/models/consumable.dart';

final List<Consumable> sourceConsumables = [
  Consumable(name: 'bread', location: 'Bread bin', expiry: Expiry(day: 28)),
  Consumable(name: 'coke', location: 'Fridge', expiry: Expiry(day: 28)),
  Consumable(name: 'coke', location: 'Fridge', expiry: Expiry(day: 28)),
  Consumable(name: 'coke', location: 'Fridge', expiry: Expiry(day: 28)),
  Consumable(name: 'butter', location: 'Fridge', expiry: Expiry(day: 28)),
  Consumable(name: 'pizza', location: 'Freezer', expiry: Expiry(day: 28)),
  Consumable(name: 'biscuits', location: 'Bread bin', expiry: Expiry(day: 28)),
  Consumable(
      name: 'english breakfast tea',
      location: 'Press',
      expiry: Expiry(day: 28, year: 23)),
  Consumable(name: 'rice', location: 'Press', expiry: Expiry(day: 28)),
  Consumable(name: 'pasta', location: 'Press', expiry: Expiry(day: 28)),
  Consumable(name: 'apple', location: 'Fruit bowl', expiry: Expiry(day: 28)),
  Consumable(name: 'orange', location: 'Fruit bowl', expiry: Expiry(day: 28)),
];
