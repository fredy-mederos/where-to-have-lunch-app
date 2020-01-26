import 'package:flutter/material.dart';

class AddPlacePage extends StatefulWidget {
  @override
  _AddPlacePageState createState() => _AddPlacePageState();
}

class _AddPlacePageState extends State<AddPlacePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 40, right: 16, left: 16),
        child: Column(
          children: [
            Text(
              "Add a Place",
              style: TextStyle(fontSize: 40),
            ),
            Card(

            )
          ],
        ),
      ),
    );
  }
}
