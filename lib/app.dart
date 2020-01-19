import 'package:flutter/material.dart';

class WhereToHaveLunchApp extends StatelessWidget {

  final Widget content;

  const WhereToHaveLunchApp({Key key, @required this.content}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Where to Have Lunch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: content,
    );
  }
}