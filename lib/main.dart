import 'package:firebase_core/firebase_core.dart';
import 'package:where_to_have_lunch/app.dart';
import 'package:where_to_have_lunch/crashlytics_app.dart';
import 'package:where_to_have_lunch/di/injector.dart';

void main() {
  Injector.init(mode: Mode.PROD, client: Client.MOBILE);
  runCrashlyticsApp(
    WhereToHaveLunchApp(),
  );
}
