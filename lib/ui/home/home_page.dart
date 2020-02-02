import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:where_to_have_lunch/res/R.dart';
import 'package:where_to_have_lunch/ui/base/bloc_state.dart';
import 'package:where_to_have_lunch/ui/choose/choose_page.dart';
import 'package:where_to_have_lunch/ui/home/home_bloc.dart';
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
    return Scaffold(
      body: currentPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onPageSelected,
        items: [
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.dice5Outline),
            title: Text(R.string.choose),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.silverwareVariant),
            title: Text(R.string.places),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.settings),
            title: Text(R.string.settings),
          ),
        ],
      ),
    );
  }

  Widget currentPage() {
    switch (currentIndex) {
      case 0:return ChoosePage();
      case 1:return PlacesPage();
      case 2:return SettingsPage();
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
