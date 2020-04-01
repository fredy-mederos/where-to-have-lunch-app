import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigatorUtils {
  static Future<T> push<T>(BuildContext context, Widget page) => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => page),
      );
}
