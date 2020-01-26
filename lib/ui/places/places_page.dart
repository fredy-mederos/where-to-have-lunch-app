import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:where_to_have_lunch/app_routes.dart';
import 'package:where_to_have_lunch/res/R.dart';
import 'package:where_to_have_lunch/res/text/icon_button_widget.dart';
import 'package:where_to_have_lunch/ui/base/page_background_widget.dart';

class PlacesPage extends StatefulWidget {
  @override
  _PlacesPageState createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  @override
  Widget build(BuildContext context) {
    return PageBackgroundWidget(
      iconRes: MdiIcons.silverwareVariant,
      rotateAngle: 0,
      child: body(),
    );
  }

  Widget body() => Padding(
        padding: const EdgeInsets.only(bottom: 40, right: 16, left: 16),
        child: Column(
          children: [
            Text(
              "Your Places",
              style: TextStyle(fontSize: 40),
            ),
            Expanded(child: Container()),
            IconButtonWidget(
              iconData: MdiIcons.plus,
              label: "Add Place",
              onPressed: addPlace,
            ),
          ],
        ),
      );

  void addPlace() {
    Navigator.pushNamed(context, AppRoutes.ADD_PLACE);
  }
}
