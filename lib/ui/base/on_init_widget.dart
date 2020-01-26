import 'package:flutter/widgets.dart';

class OnInitWidget extends StatefulWidget {
  final Widget child;

  final Function(BuildContext) onInit;

  const OnInitWidget({Key key, @required this.child, this.onInit})
      : super(key: key);

  @override
  _OnInitWidgetState createState() => _OnInitWidgetState();
}

class _OnInitWidgetState extends State<OnInitWidget> {
  @override
  void initState() {
    super.initState();
    if (widget.onInit != null) widget.onInit(context);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
