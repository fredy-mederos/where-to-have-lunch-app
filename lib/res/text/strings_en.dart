import 'dart:ui';

import 'package:where_to_have_lunch/res/text/strings_base.dart';

class StringsEn implements StringsBase {
  @override
  TextDirection get textDirection => TextDirection.ltr;

  String get appName => "Where To Have Lunch?";

  String get loginWithGoogle => "Login With Google";

  String get welcomeMessageBody =>
      "The easiest way of choosing where to have a nice meal with colleges";

  String get welcomeMessageTitle => "Welcome to \"$appName\"";

  String get places => "Places";

  String get settings => "Settings";

  String get choose => "Choose!";

  String get addAPlace => "Add a Place";

  String get requiredField => "This field is required.";

  String get placeName => "Place name";

  String get description => "Description";

  String get save => "Save";

  String get logout => "Logout";

  @override
  String get addPlace => "Add Place";
}
