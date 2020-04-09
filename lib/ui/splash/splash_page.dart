import 'package:flutter/material.dart';
import 'package:where_to_have_lunch/app_routes.dart';
import 'package:where_to_have_lunch/ui/base/viewmodel/state_with_viewmodel.dart';
import 'package:where_to_have_lunch/ui/splash/splash_viewmodel.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends StateWithViewModel<SplashPage, SplashViewModel> {
  @override
  void initState() {
    super.initState();
    viewModel.isLoggedIn().then((isLoggedIn) {
      if (isLoggedIn) {
        Navigator.pushReplacementNamed(context, AppRoutes.HOME);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.LOGIN);
      }
    });
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Container();
  }
}
