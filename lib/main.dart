import 'package:where_to_have_lunch/app.dart';
import 'package:where_to_have_lunch/crashlytics_app.dart';
import 'package:where_to_have_lunch/di/injector.dart';

void main() {
  Injector.initProd();
  runCrashlyticsApp(
    WhereToHaveLunchApp(),
  );
}
