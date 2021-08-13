import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:where_to_have_lunch/app_routes.dart';
import 'package:where_to_have_lunch/ui/base/viewmodel/state_with_viewmodel.dart';
import 'package:where_to_have_lunch/ui/settings/configs_viewmodel.dart';

import 'di/injector.dart';
import 'domain/models/configs.dart';
import 'generated/l10n.dart';
import 'res/R.dart';

class WhereToHaveLunchApp extends StatefulWidget {
  @override
  _WhereToHaveLunchAppState createState() => _WhereToHaveLunchAppState();
}

class _WhereToHaveLunchAppState extends StateWithViewModel<WhereToHaveLunchApp, ConfigsViewModel> {
  @override
  void initState() {
    super.initState();
    viewModel.loadConfigs();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return StreamBuilder<Configs>(
      stream: viewModel.configsStream,
      builder: (context, snapshot) {
        final configs = snapshot.data;
        return configs == null
            ? Container()
            : app(
                settings: configs
              );
      },
    );
  }

  MaterialApp app({
    required Configs settings
  }) =>
      MaterialApp(
        title: "Where to have lunch",
        debugShowCheckedModeBanner: Injector.instance!.isInDebugMode(),
        theme: settings.darkMode ? _darkTheme : _lightTheme,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
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
