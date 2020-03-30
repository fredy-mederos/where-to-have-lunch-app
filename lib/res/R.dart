import 'package:flutter/widgets.dart';
import 'package:where_to_have_lunch/res/text/custom_localizations_delegate.dart';
import 'package:where_to_have_lunch/res/text/strings_base.dart';

const int _MAX_SIZE = 600;

class R {
  static StringsBase get string => CustomLocalizationsDelegate.stringsBase;

  static bool isSmallScreenSize(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.width;
    return shortestSide < _MAX_SIZE;
  }
}
