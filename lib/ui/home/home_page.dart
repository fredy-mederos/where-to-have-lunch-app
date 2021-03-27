import 'package:flutter/material.dart';
import 'package:where_to_have_lunch/res/R.dart';
import 'package:where_to_have_lunch/ui/base/viewmodel/state_with_viewmodel.dart';
import 'package:where_to_have_lunch/ui/choose/choose_page.dart';
import 'package:where_to_have_lunch/ui/common/inner_navigator.dart';
import 'package:where_to_have_lunch/ui/home/home_viewmodel.dart';
import 'package:where_to_have_lunch/ui/navigation_menu/bottom_menu_widget.dart';
import 'package:where_to_have_lunch/ui/navigation_menu/lateral_menu_widget.dart';
import 'package:where_to_have_lunch/ui/network_error/network_error_widget.dart';
import 'package:where_to_have_lunch/ui/places/places_page.dart';
import 'package:where_to_have_lunch/ui/settings/settings_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends StateWithViewModel<HomePage, HomeViewModel> {
  int currentIndex = 0;
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget buildWidget(BuildContext context) => getBody(
        child: getBodyLayout(),
      );

  Widget getBodyLayout() {
    if (R.isSmallWidthSize(context))
      return mobileLayout();
    else
      return tabletLayout();
  }

  Widget getBody({required Widget child}) => WillPopScope(
        onWillPop: () async {
          if (currentIndex != 1) return true;
          return !(await navigatorKey.currentState?.maybePop() == true);
        },
        child: child,
      );

  Widget mobileLayout() => Scaffold(
        body: Column(
          children: [
            Expanded(child: currentPage()),
            NetworkErrorWidget(),
          ],
        ),
        bottomNavigationBar: BottomMenuWidget(
          onPageSelected: onPageSelected,
          currentPage: currentIndex,
        ),
      );

  Widget tabletLayout() => Scaffold(
        body: Row(
          children: [
            LateralMenuWidget(
              onPageSelected: onPageSelected,
              currentPage: currentIndex,
            ),
            Expanded(child: currentPage()),
          ],
        ),
      );

  Widget currentPage() {
    switch (currentIndex) {
      case 0:
        return ChoosePage();
      case 1:
        return getPlacesPageWidget();
      case 2:
        return SettingsPage();
    }
    return Center(
      child: Text("No Page"),
    );
  }

  Widget getPlacesPageWidget() {
    if (R.isSmallWidthSize(context))
      return PlacesPage();
    else //it is a tablet device use an inner navigator
      return InnerNavigator(
        navigatorKey: navigatorKey,
        child: PlacesPage(),
      );
  }

  void onPageSelected(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
