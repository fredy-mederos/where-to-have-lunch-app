import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:where_to_have_lunch/app_routes.dart';
import 'package:where_to_have_lunch/domain/models/user.dart';
import 'package:where_to_have_lunch/res/R.dart';
import 'package:where_to_have_lunch/ui/base/icon_button_widget.dart';
import 'package:where_to_have_lunch/ui/base/bloc_state.dart';
import 'package:where_to_have_lunch/ui/base/page_background_widget.dart';
import 'package:where_to_have_lunch/ui/settings/settings_bloc.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends StateWithBloC<SettingsPage, SettingsBloC> {
  @override
  void initState() {
    super.initState();
    bloc.loadCurrentUser();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return PageBackgroundWidget(
      iconRes: MdiIcons.settings,
      child: body(),
    );
  }

  Widget body() => Padding(
        padding: const EdgeInsets.only(bottom: 40, right: 16, left: 16),
        child: Column(
          children: [
            title(),
            Expanded(child: Container()),
            IconButtonWidget(
              iconData: MdiIcons.logout,
              label: R.string.logout,
              onPressed: logOut,
            ),
          ],
        ),
      );

  Widget title() => StreamBuilder<User>(
      stream: bloc.currentUserStream,
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
                        backgroundImage: NetworkImage(currentUser.photoUrl),
                        radius: 40,
                      )
                    : Container(),
              ],
            ),
            Container(height: 16),
            Text(
              "Hello ${currentUser.name}!",
              style: TextStyle(fontSize: 30),
            ),
          ],
        );
      });

  void logOut() {
    bloc.logout();
    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.LOGIN, (_) => false);
  }
}
