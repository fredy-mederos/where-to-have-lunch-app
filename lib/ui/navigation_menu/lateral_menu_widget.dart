import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:where_to_have_lunch/res/R.dart';

class LateralMenuWidget extends StatelessWidget {
  final Function(int) onPageSelected;
  final int currentPage;

  const LateralMenuWidget({
    Key key,
    @required this.onPageSelected,
    @required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 4),
      child: Material(
        elevation: 2,
        child: Container(
          width: 250,
          child: ListView(
            children: <Widget>[
              ListTile(
                selected: currentPage == 0,
                leading: Icon(MdiIcons.dice5Outline),
                title: Text(R.string.choose),
                onTap: () => onPageSelected(0),
              ),
              ListTile(
                selected: currentPage == 1,
                leading: Icon(MdiIcons.silverwareVariant),
                title: Text(R.string.places),
                onTap: () => onPageSelected(1),
              ),
              ListTile(
                selected: currentPage == 2,
                leading: Icon(MdiIcons.cog),
                title: Text(R.string.settings),
                onTap: () => onPageSelected(2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
