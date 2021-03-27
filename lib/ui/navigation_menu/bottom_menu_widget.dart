import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:where_to_have_lunch/res/R.dart';

class BottomMenuWidget extends StatelessWidget {
  final Function(int) onPageSelected;
  final int currentPage;

  const BottomMenuWidget({
    Key? key,
    required this.onPageSelected,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentPage,
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
          icon: Icon(MdiIcons.cog),
          title: Text(R.string.settings),
        ),
      ],
    );
  }
}
