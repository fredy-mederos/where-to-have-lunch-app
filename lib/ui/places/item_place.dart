import 'package:flutter/material.dart';
import 'package:where_to_have_lunch/domain/models/place.dart';

class ItemPlace extends StatelessWidget {
  final Place place;

  const ItemPlace({Key key, this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(place.name),
        ),
      ),
    );
  }
}
