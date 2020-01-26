import 'package:flutter/material.dart';
import 'package:where_to_have_lunch/domain/models/user.dart';
import 'package:where_to_have_lunch/ui/base/bloc_state.dart';
import 'package:where_to_have_lunch/ui/home/home_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends StateWithBloC<HomePage, HomeBloC> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Main Page"),
      ),
    );
  }
}
