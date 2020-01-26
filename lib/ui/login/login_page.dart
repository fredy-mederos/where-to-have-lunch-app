import 'package:flutter/material.dart';
import 'package:where_to_have_lunch/app_routes.dart';
import 'package:where_to_have_lunch/res/R.dart';
import 'package:where_to_have_lunch/ui/base/bloc_state.dart';
import 'package:where_to_have_lunch/ui/home/home_page.dart';
import 'package:where_to_have_lunch/ui/login/login_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends StateWithBloC<LoginPage, LoginBloC> {
  @override
  void initState() {
    super.initState();
    bloc.onUserLogin.listen((user) {
      Navigator.pushReplacementNamed(context, AppRoutes.HOME);
    });
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(R.string.appName),
      ),
      body: Center(
        child: MaterialButton(
          child: Text("Login"),
          onPressed: () {
            bloc.login();
          },
        ),
      ),
    );
  }
}
