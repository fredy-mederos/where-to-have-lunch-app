import 'dart:ui';

import 'package:where_to_have_lunch/res/text/strings_base.dart';

class StringsEn implements StringsBase {
  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get appName => "Where To Have Lunch?";

  @override
  String get loginWithGoogle => "Login With Google";

  @override
  String get welcomeMessageBody =>
      "The easiest way of choosing where to have a nice meal with colleges";

  @override
  String get welcomeMessageTitle => "Welcome to \"$appName\"";
}
