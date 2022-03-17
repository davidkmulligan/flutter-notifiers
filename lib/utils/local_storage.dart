import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

Future<String> readFromLocalStorage() async {
  try {
    final file = await _localFile;
    final contents = await file.readAsString();
    return contents;
  } catch (e) {
    return 'nil';
  }
}

Future<File> writeToLocalStorage(String contents) async {
  final file = await _localFile;
  return file.writeAsString(contents);
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  // debugPrint('path: ' + directory.path);
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/store.json');
}

// void printPath() async {
//   final _path = await _localPath;
// }
