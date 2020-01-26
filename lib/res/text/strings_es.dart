import 'dart:ui';

import 'package:where_to_have_lunch/res/text/strings_base.dart';

class StringsEs implements StringsBase {
  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get appName => "Donde Almorzar?";

  @override
  String get loginWithGoogle => "Entra con Google";

  @override
  String get welcomeMessageBody =>
      "La forma mas facil de escoger donde tener un buen almuerzo con tus colegas";

  @override
  String get welcomeMessageTitle => "Bienvenido a \"$appName\"";
}
