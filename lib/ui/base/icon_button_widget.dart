import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final Function onPressed;
  final String label;
  final IconData iconData;

  const IconButtonWidget({
    Key key,
    @required this.onPressed,
    @required this.label,
    @required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: RaisedButton.icon(
        icon: Icon(iconData),
        label: Text(label),
        onPressed: onPressed,
      ),
    );
  }
}
