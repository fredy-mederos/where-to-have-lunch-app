import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:where_to_have_lunch/app_routes.dart';
import 'package:where_to_have_lunch/res/R.dart';
import 'package:where_to_have_lunch/ui/base/bloc_state.dart';
import 'package:where_to_have_lunch/ui/base/on_init_widget.dart';
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

  void registerErrorStream(BuildContext cntx) {
    bloc.errorMessageStream.listen((error) {
      if (error != null)
        Scaffold.of(cntx).showSnackBar(SnackBar(
          content: Text(error),
        ));
    });
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: OnInitWidget(
        onInit: registerErrorStream,
        child: Stack(
          children: [
            background(),
            content(),
          ],
        ),
      ),
    );
  }

  Widget content() => Padding(
        padding: const EdgeInsets.only(bottom: 40, right: 16, left: 16),
        child: Column(
          children: [
            Text(
              R.string.welcomeMessageTitle,
              style: TextStyle(fontSize: 38),
            ),
            Text(
              R.string.welcomeMessageBody,
              style: TextStyle(fontSize: 30),
            ),
            Expanded(child: Container()),
            StreamBuilder<bool>(
                stream: bloc.isLoadingStream,
                initialData: false,
                builder: (context, snapshot) {
                  return loginSection(isLoading: snapshot.data);
                }),
          ],
        ),
      );

  Widget background() => Center(
        child: Opacity(
          opacity: 0.2,
          child: Icon(
            MdiIcons.silverwareVariant,
            size: 400,
            color: Colors.grey,
          ),
        ),
      );

  Widget loginButton({bool isLoading}) => RaisedButton.icon(
        icon: Icon(MdiIcons.google),
        label: Text(R.string.loginWithGoogle),
        onPressed: isLoading
            ? null
            : () {
                bloc.login();
              },
      );

  Widget loginSection({bool isLoading}) {
    return Column(
      children: [
        isLoading ? CircularProgressIndicator() : Container(),
        loginButton(isLoading: isLoading),
      ],
    );
  }
}
