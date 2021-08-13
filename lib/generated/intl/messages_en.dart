// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(user) => "Hello ${user}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addAPlace": MessageLookupByLibrary.simpleMessage("Add a Place"),
        "addPlace": MessageLookupByLibrary.simpleMessage("Add Place"),
        "appName": MessageLookupByLibrary.simpleMessage("Where To Have Lunch?"),
        "choose": MessageLookupByLibrary.simpleMessage("Choose!"),
        "darkTheme": MessageLookupByLibrary.simpleMessage("Dark Theme"),
        "deletePlaceConfirmation": MessageLookupByLibrary.simpleMessage(
            "Do you want to delete this place?"),
        "demoMode": MessageLookupByLibrary.simpleMessage("Demo Mode"),
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "editPlace": MessageLookupByLibrary.simpleMessage("Edit Place"),
        "helloUser": m0,
        "hello_world": MessageLookupByLibrary.simpleMessage("Hello World!"),
        "loginWithGoogle":
            MessageLookupByLibrary.simpleMessage("Login With Google"),
        "logout": MessageLookupByLibrary.simpleMessage("Logout"),
        "placeName": MessageLookupByLibrary.simpleMessage("Place name"),
        "places": MessageLookupByLibrary.simpleMessage("Places"),
        "requiredField":
            MessageLookupByLibrary.simpleMessage("This field is required."),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "welcomeMessageBody": MessageLookupByLibrary.simpleMessage(
            "The easiest way of choosing where to have a nice meal with colleges"),
        "welcomeMessageTitle": MessageLookupByLibrary.simpleMessage(
            "Welcome to \"Where to Have Lunch?\""),
        "youAreOffline":
            MessageLookupByLibrary.simpleMessage("You are offline"),
        "yourPlaces": MessageLookupByLibrary.simpleMessage("Your Places")
      };
}
