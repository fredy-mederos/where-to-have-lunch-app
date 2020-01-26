import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BigIconBackgroundWidget extends StatelessWidget {
  final IconData iconRes;
  final Color color;
  final double rotateAngle;

  const BigIconBackgroundWidget({
    Key key,
    @required this.iconRes,
    this.color = Colors.grey,
    this.rotateAngle = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotateAngle,
      child: Center(
        child: Opacity(
          opacity: 0.15,
          child: Icon(
            iconRes,
            size: 400,
            color: color,
          ),
        ),
      ),
    );
  }
}
