import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:where_to_have_lunch/app_routes.dart';
import 'package:where_to_have_lunch/di/viewmodel_provider.dart';
import 'package:where_to_have_lunch/res/R.dart';
import 'package:where_to_have_lunch/ui/base/icon_button_widget.dart';
import 'package:where_to_have_lunch/ui/base/on_init_widget.dart';
import 'package:where_to_have_lunch/ui/base/page_background_widget.dart';
import 'package:where_to_have_lunch/ui/base/viewmodel/state_with_viewmodel.dart';
import 'package:where_to_have_lunch/ui/login/login_viewmodel.dart';
import 'package:where_to_have_lunch/ui/settings/configs_viewmodel.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends StateWithViewModel<LoginPage, LoginViewModel> {
  ConfigsViewModel configsViewModel;

  @override
  void initState() {
    super.initState();
    configsViewModel = ViewModelProvider.of(context);
    viewModel.onUserLogin.listen((user) async {
      await configsViewModel.loadConfigs();
      Navigator.pushReplacementNamed(context, AppRoutes.HOME);
    });
  }

  void registerErrorStream(BuildContext cntx) {
    viewModel.errorMessageStream.listen((error) {
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
        child: PageBackgroundWidget(
          iconRes: MdiIcons.silverwareVariant,
          rotateAngle: 0,
          child: content(),
        ),
      ),
    );
  }

  Widget content() => Padding(
        padding: const EdgeInsets.only(bottom: 50, right: 16, left: 16),
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
                stream: viewModel.isLoadingStream,
                initialData: false,
                builder: (context, snapshot) {
                  return loginSection(isLoading: snapshot.data);
                }),
          ],
        ),
      );

  Widget loginButton({bool isLoading}) => IconButtonWidget(
        iconData: MdiIcons.google,
        label: R.string.loginWithGoogle,
        onPressed: isLoading
            ? null
            : () {
                viewModel.login();
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
