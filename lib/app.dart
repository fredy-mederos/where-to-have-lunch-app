import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:where_to_have_lunch/res/text/custom_localizations_delegate.dart';
import 'package:where_to_have_lunch/app_routes.dart';

import 'res/R.dart';
import 'di/injector.dart';

class WhereToHaveLunchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localizationDelegate = CustomLocalizationsDelegate();
    return MaterialApp(
      title: R.string.appName,
      debugShowCheckedModeBanner: Injector.instance.isInDebugMode(),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      localizationsDelegates: [
        localizationDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: localizationDelegate.supportedLocales,
      localeResolutionCallback: localizationDelegate.resolution(
        fallback: Locale("en"),
      ),
      initialRoute: AppRoutes.SPLASH,
      routes: AppRoutes.routes(),
    );
  }
}
