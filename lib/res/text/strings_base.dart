import 'package:flutter/widgets.dart';

//en
abstract class StringsBase implements WidgetsLocalizations {
  @override
  TextDirection get textDirection => TextDirection.ltr;

  String appName;
}
