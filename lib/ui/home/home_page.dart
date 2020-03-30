import 'package:flutter/material.dart';
import 'package:where_to_have_lunch/res/R.dart';
import 'package:where_to_have_lunch/ui/base/bloc/bloc_state.dart';
import 'package:where_to_have_lunch/ui/choose/choose_page.dart';
import 'package:where_to_have_lunch/ui/home/home_bloc.dart';
import 'package:where_to_have_lunch/ui/navigation_menu/bottom_menu_widget.dart';
import 'package:where_to_have_lunch/ui/navigation_menu/lateral_menu_widget.dart';
import 'package:where_to_have_lunch/ui/network_error/network_error_widget.dart';
import 'package:where_to_have_lunch/ui/places/places_page.dart';
import 'package:where_to_have_lunch/ui/settings/settings_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends StateWithBloC<HomePage, HomeBloC> {
  int currentIndex = 0;

  @override
  Widget buildWidget(BuildContext context) {
    if (R.isSmallWidthSize(context))
      return mobileLayout();
    else
      return tabletLayout();
  }

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
        return PlacesPage();
      case 2:
        return SettingsPage();
    }
    return Center(
      child: Text("No Page"),
    );
  }

  void onPageSelected(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
