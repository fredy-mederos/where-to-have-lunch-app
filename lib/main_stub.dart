import 'package:flutter/material.dart';
import 'package:where_to_have_lunch/app.dart';
import 'package:where_to_have_lunch/di/injector.dart';
import 'package:where_to_have_lunch/di/stub_features.dart';
import 'package:where_to_have_lunch/ui/login/login_page.dart';
import 'package:where_to_have_lunch/ui/splash/splash_page.dart';

void main() {
  Injector.initDemo(stubFeatures: [StubFeatures.USER]);
  runApp(
    WhereToHaveLunchApp(),
  );
}
