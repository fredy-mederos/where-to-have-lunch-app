import 'package:flutter/material.dart';
import 'package:where_to_have_lunch/app.dart';
import 'package:where_to_have_lunch/di/injector.dart';
import 'package:where_to_have_lunch/ui/login/login_page.dart';

void main() {
  Injector.initDemo();
  runApp(WhereToHaveLunchApp(
    content: LoginPage(),
  ));
}
