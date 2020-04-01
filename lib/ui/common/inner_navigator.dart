import 'package:flutter/material.dart';

class InnerNavigator extends StatelessWidget {
  final Key navigatorKey;
  final Widget child;

  const InnerNavigator({
    Key key,
    @required this.navigatorKey,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (config) => MaterialPageRoute(
        builder: (_) => child,
      ),
    );
  }
}
