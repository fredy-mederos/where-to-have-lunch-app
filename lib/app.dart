import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:where_to_have_lunch/app_routes.dart';
import 'package:where_to_have_lunch/res/text/custom_localizations_delegate.dart';
import 'package:where_to_have_lunch/ui/base/bloc/bloc_state.dart';
import 'package:where_to_have_lunch/ui/settings/configs_bloc.dart';

import 'di/injector.dart';
import 'domain/models/configs.dart';
import 'res/R.dart';

class WhereToHaveLunchApp extends StatefulWidget {
  @override
  _WhereToHaveLunchAppState createState() => _WhereToHaveLunchAppState();
}

class _WhereToHaveLunchAppState extends StateWithBloC<WhereToHaveLunchApp, ConfigsBloC> {
  @override
  void initState() {
    super.initState();
    bloc.loadConfigs();
  }

  @override
  Widget buildWidget(BuildContext context) {
    final localizationDelegate = CustomLocalizationsDelegate();
    return StreamBuilder<Configs>(
      stream: bloc.configsStream,
      builder: (context, snapshot) {
        final configs = snapshot.data;
        return configs == null
            ? Container()
            : app(
                settings: configs,
                localizationDelegate: localizationDelegate,
              );
      },
    );
  }

  MaterialApp app({
    @required Configs settings,
    @required CustomLocalizationsDelegate localizationDelegate,
  }) =>
      MaterialApp(
        title: R.string.appName,
        debugShowCheckedModeBanner: Injector.instance.isInDebugMode(),
        theme: settings.darkMode ? _darkTheme : _lightTheme,
        localizationsDelegates: [
          localizationDelegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: localizationDelegate.supportedLocales,
        localeResolutionCallback: localizationDelegate.resolution(
          fallback: Locale(
            "en",
          ), //todo the selected language could be included also in the configs settings
        ),
        initialRoute: AppRoutes.SPLASH,
        routes: AppRoutes.routes(),
      );
}

ThemeData get _lightTheme => ThemeData(
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        brightness: Brightness.light,
      ),
      brightness: Brightness.light,
      primarySwatch: Colors.deepOrange,
      fontFamily: GoogleFonts.poppins().fontFamily,
    );

ThemeData get _darkTheme => ThemeData(
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        brightness: Brightness.dark,
      ),
      brightness: Brightness.dark,
      primarySwatch: Colors.deepOrange,
      accentColor: Colors.deepOrange,
      fontFamily: GoogleFonts.poppins().fontFamily,
    );
