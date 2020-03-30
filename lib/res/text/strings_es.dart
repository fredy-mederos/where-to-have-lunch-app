import 'dart:ui';

import 'package:where_to_have_lunch/res/text/strings_base.dart';

class StringsEs implements StringsBase {
  @override
  TextDirection get textDirection => TextDirection.ltr;

  String get appName => "Donde Almorzar?";

  String get loginWithGoogle => "Entra con Google";

  String get welcomeMessageBody => "La forma mas facil de escoger donde tener un buen almuerzo con tus colegas";

  String get welcomeMessageTitle => "Bienvenido a \"$appName\"";

  String get places => "Lugares";

  String get settings => "Configuracion";

  String get choose => "Elegir!";

  String get addAPlace => "Anadir un lugar";

  String get description => "Descripcion";

  String get logout => "Cerrar sesion";

  String get placeName => "Nombre del lugar";

  String get requiredField => "Campo requerido";

  String get save => "Guardar";

  String get addPlace => "Anadir lugar";

  String get darkTheme => "Tema oscuro";

  String get yourPlaces => "Tus lugares";

  String get editPlace => "Editar Lugar";

  String helloUser(String userName) {
    return "Hola $userName!";
  }

  String get youAreOffline => "Estas sin conexion";
}
