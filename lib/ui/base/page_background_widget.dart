import 'package:flutter/material.dart';

import 'big_icon_background_widget.dart';

class PageBackgroundWidget extends StatelessWidget {
  final Widget child;
  final IconData iconRes;
  final double rotateAngle;

  const PageBackgroundWidget({
    Key key,
    @required this.child,
    @required this.iconRes,
    this.rotateAngle = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BigIconBackgroundWidget(
          iconRes: iconRes,
          rotateAngle: rotateAngle,
        ),
        child,
      ],
    );
  }
}
