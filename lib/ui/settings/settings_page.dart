import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:where_to_have_lunch/app_routes.dart';
import 'package:where_to_have_lunch/di/viewmodel_provider.dart';
import 'package:where_to_have_lunch/domain/models/configs.dart';
import 'package:where_to_have_lunch/domain/models/user.dart';
import 'package:where_to_have_lunch/res/R.dart';
import 'package:where_to_have_lunch/ui/base/icon_button_widget.dart';
import 'package:where_to_have_lunch/ui/base/page_background_widget.dart';
import 'package:where_to_have_lunch/ui/base/viewmodel/state_with_viewmodel.dart';
import 'package:where_to_have_lunch/ui/settings/configs_viewmodel.dart';
import 'package:where_to_have_lunch/ui/settings/settings_viewmodel.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends StateWithViewModel<SettingsPage, SettingsViewModel> {
  late ConfigsViewModel configsViewModel;

  @override
  void initState() {
    super.initState();
    configsViewModel = ViewModelProvider.of(context);
    viewModel.loadCurrentUser();
  }

  @override
  Widget buildWidget(BuildContext context) {
    final smallHeight = R.isSmallHeightSize(context);

    return smallHeight ? smallBody() : bigBody();
  }

  Widget bigBody() => Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
        body: PageBackgroundWidget(
          iconRes: MdiIcons.cog,
          child: body(false),
        ),
      );

  Widget smallBody() => Scaffold(
        body: PageBackgroundWidget(
            iconRes: MdiIcons.cog,
            child: SingleChildScrollView(
              child: body(true),
            )),
      );

  Widget body(bool smallHeight) => Padding(
        padding: EdgeInsets.only(top: smallHeight ? 40 : 0, bottom: smallHeight ? 10 : 40, right: 16, left: 16),
        child: Column(
          children: [
            title(),
            Container(height: 40),
            configsCard(),
            smallHeight ? Container(height: 20) : Expanded(child: Container()),
            IconButtonWidget(
              iconData: MdiIcons.logout,
              label: R.string.logout,
              onPressed: logOut,
            ),
          ],
        ),
      );

  Widget title() => StreamBuilder<UserLocal>(
      stream: viewModel.currentUserStream,
      builder: (context, snapshot) {
        final currentUser = snapshot.data;
        if (currentUser == null) return Container();
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  MdiIcons.account,
                  size: 60,
                  color: Colors.grey,
                ),
                currentUser.photoUrl != null
                    ? CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(currentUser.photoUrl ?? ""),
                        radius: 40,
                      )
                    : Container(),
              ],
            ),
            Container(height: 16),
            Text(
              R.string.helloUser(currentUser.name),
              style: TextStyle(fontSize: 30),
            ),
          ],
        );
      });

  Widget configsCard() => StreamBuilder<Configs>(
      stream: configsViewModel.configsStream,
      builder: (context, snapshot) {
        final config = snapshot.data;
        return Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(R.string.darkTheme),
                    Expanded(child: Container()),
                    if (config != null)
                      Switch.adaptive(
                        value: config.darkMode,
                        onChanged: (value) {
                          configsViewModel.setDarkMode(darkMode: value);
                        },
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      });

  void logOut() {
    viewModel.logout();
    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.LOGIN, (_) => false);
  }
}
