import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:where_to_have_lunch/res/text/custom_localizations_delegate.dart';

import 'res/R.dart';
import 'di/injector.dart';

class WhereToHaveLunchApp extends StatelessWidget {
  final Widget content;

  const WhereToHaveLunchApp({Key key, @required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizationDelegate = CustomLocalizationsDelegate();
    return MaterialApp(
      title: R.string.appName,
      debugShowCheckedModeBanner: Injector.instance.isInDebugMode(),
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.poppins().fontFamily),
      home: content,
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
    );
  }
}