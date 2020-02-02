import 'package:flutter/material.dart';

class NoOverScrollWidget extends StatelessWidget {
  final Widget child;

  const NoOverScrollWidget({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: _NoOverScrollBehavior(),
      child: child,
    );
  }
}

class _NoOverScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
