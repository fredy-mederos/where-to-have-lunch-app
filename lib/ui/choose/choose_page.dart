import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:where_to_have_lunch/res/text/icon_button_widget.dart';
import 'package:where_to_have_lunch/ui/base/big_icon_background_widget.dart';
import 'package:where_to_have_lunch/ui/base/page_background_widget.dart';

class ChoosePage extends StatefulWidget {
  @override
  _ChoosePagState createState() => _ChoosePagState();
}

class _ChoosePagState extends State<ChoosePage> {
  @override
  Widget build(BuildContext context) {
    return PageBackgroundWidget(
      iconRes: MdiIcons.dice5Outline,
      child: body(),
    );
  }

  Widget body() => Padding(
        padding: const EdgeInsets.only(bottom: 40, right: 16, left: 16),
        child: Column(
          children: [
            Text(
              "Choose where to have a lunch randomly!",
              style: TextStyle(fontSize: 40),
            ),
            Expanded(child: Container()),
            IconButtonWidget(
              onPressed: () {},
              iconData: MdiIcons.dice5Outline,
              label: "Roll the dice",
            ),
          ],
        ),
      );
}
