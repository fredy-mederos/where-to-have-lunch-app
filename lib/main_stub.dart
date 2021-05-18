import 'package:flutter/material.dart';
import 'package:where_to_have_lunch/app.dart';
import 'package:where_to_have_lunch/di/injector.dart';

void main() {
  Injector.init(mode: Mode.STUB, client: Client.MOBILE);
  runApp(
    WhereToHaveLunchApp(),
  );
}
