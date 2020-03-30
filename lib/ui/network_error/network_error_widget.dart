import 'package:flutter/material.dart';
import 'package:where_to_have_lunch/res/R.dart';
import 'package:where_to_have_lunch/ui/base/bloc/bloc_state.dart';
import 'package:where_to_have_lunch/ui/network_error/network_error_bloc.dart';

class NetworkErrorWidget extends StatefulWidget {
  @override
  _NetworkErrorWidgetState createState() => _NetworkErrorWidgetState();
}

class _NetworkErrorWidgetState extends StateWithBloC<NetworkErrorWidget, NetworkErrorBloC> {
  @override
  Widget buildWidget(BuildContext context) {
    return StreamBuilder<bool>(
      stream: bloc.isConnected,
      initialData: true,
      builder: (context, snapshot) {
        final isConnected = snapshot.data ?? true;
        return isConnected ? Container() : offlineWidget();
      },
    );
  }

  Widget offlineWidget() => Container(
        height: 30,
        color: Colors.red,
        child: Center(
          child: Text(
            R.string.youAreOffline,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
}
