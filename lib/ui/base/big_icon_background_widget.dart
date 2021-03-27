import 'package:flutter/material.dart';

class BigIconBackgroundWidget extends StatelessWidget {
  final IconData iconRes;
  final Color color;
  final double rotateAngle;

  const BigIconBackgroundWidget({
    Key? key,
    required this.iconRes,
    this.color = Colors.grey,
    this.rotateAngle = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Opacity(
        opacity: 0.15,
        child: Transform.rotate(
          angle: rotateAngle,
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
