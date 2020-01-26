import 'package:flutter/widgets.dart';
import 'package:where_to_have_lunch/ui/add_place/add_place_page.dart';
import 'package:where_to_have_lunch/ui/home/home_page.dart';
import 'package:where_to_have_lunch/ui/login/login_page.dart';
import 'package:where_to_have_lunch/ui/splash/splash_page.dart';

class AppRoutes {
  static final String SPLASH = "/";
  static final String LOGIN = "/login";
  static final String HOME = "/home";
  static final String ADD_PLACE = "/add_place";

  static Map<String, WidgetBuilder> routes() => {
        SPLASH: (context) => SplashPage(),
        LOGIN: (context) => LoginPage(),
        HOME: (context) => HomePage(),
        ADD_PLACE: (context) => AddPlacePage(),
      };
}
