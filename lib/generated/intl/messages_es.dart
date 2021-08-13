// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'es';

  static String m0(user) => "Hola ${user}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addAPlace": MessageLookupByLibrary.simpleMessage("Anadir un lugar"),
        "addPlace": MessageLookupByLibrary.simpleMessage("Anadir lugar"),
        "appName": MessageLookupByLibrary.simpleMessage("Donde Almorzar?"),
        "choose": MessageLookupByLibrary.simpleMessage("Elegir!"),
        "darkTheme": MessageLookupByLibrary.simpleMessage("Tema oscuro"),
        "demoMode": MessageLookupByLibrary.simpleMessage("Modo Demo"),
        "description": MessageLookupByLibrary.simpleMessage("Descripcion"),
        "editPlace": MessageLookupByLibrary.simpleMessage("Editar Lugar"),
        "helloUser": m0,
        "hello_world": MessageLookupByLibrary.simpleMessage("Hello World!"),
        "loginWithGoogle":
            MessageLookupByLibrary.simpleMessage("Entra con Google"),
        "placeName": MessageLookupByLibrary.simpleMessage("Nombre del lugar"),
        "places": MessageLookupByLibrary.simpleMessage("Lugares"),
        "requiredField":
            MessageLookupByLibrary.simpleMessage("Campo requerido."),
        "save": MessageLookupByLibrary.simpleMessage("Guardar"),
        "settings": MessageLookupByLibrary.simpleMessage("Configuracion"),
        "welcomeMessageBody": MessageLookupByLibrary.simpleMessage(
            "La forma mas facil de escoger donde tener un buen almuerzo con tus colegas"),
        "welcomeMessageTitle": MessageLookupByLibrary.simpleMessage(
            "Bienvenido a \"Donde Almorzar?\""),
        "youAreOffline":
            MessageLookupByLibrary.simpleMessage("Estas sin conexion"),
        "yourPlaces": MessageLookupByLibrary.simpleMessage("Tus lugares")
      };
}
