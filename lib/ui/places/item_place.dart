import 'package:flutter/material.dart';
import 'package:where_to_have_lunch/domain/models/place.dart';

class ItemPlace extends StatelessWidget {
  final Place place;

  const ItemPlace({Key key, this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: place.color.color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              place.name,
              style: TextStyle(
                fontSize: 18,
                color: place.color.textColor,
              ),
            ),
            Text(
              place.description,
              style: TextStyle(
                fontSize: 12,
                color: place.color.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
