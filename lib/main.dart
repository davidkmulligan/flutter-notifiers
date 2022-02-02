import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import 'package:pantry/app/store.dart';
import 'package:pantry/app/app.dart';

void main() {
  Store.init();
  Store.sortInventoryGroups();

  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

  runApp(const App());
}
