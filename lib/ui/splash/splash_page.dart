import 'package:flutter/material.dart';
import 'package:where_to_have_lunch/ui/base/bloc_state.dart';
import 'package:where_to_have_lunch/ui/home/man_page.dart';
import 'package:where_to_have_lunch/ui/login/login_page.dart';
import 'package:where_to_have_lunch/ui/splash/splash_bloc.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends StateWithBloC<SplashPage, SplashBloC> {
  @override
  void initState() {
    super.initState();
    bloc.isLoggedIn().then((isLoggedIn) {
      if (isLoggedIn) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => MainPage()));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => LoginPage()));
      }
    });
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Container();
  }
}
