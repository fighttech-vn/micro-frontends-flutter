import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

class TestHelper {
  static String readJson(String name) {
    var dir = Directory.current.path;
    if (dir.endsWith('/test')) {
      dir = dir.replaceAll('/test', '');
    }
    return File('$dir/test/$name').readAsStringSync();
  }

  static Future<String> loadString(String path) async {
    return rootBundle.loadString(path);
  }
}
