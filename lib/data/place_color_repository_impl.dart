import 'package:flutter/material.dart';
import 'package:where_to_have_lunch/domain/models/place_color.dart';
import 'package:where_to_have_lunch/domain/repository/place_color_repostitory.dart';

class PlaceColorRepositoryImpl implements PlaceColorRepository {

  @override
  List<PlaceColor> getPlaceColors() {
    return [
      PlaceColor(
        id: "white",
        name: "White",
        color: Colors.grey.shade300,
        textColor: Colors.black,
      ),
      PlaceColor(
        id: "gray",
        name: "Gray",
        color: Colors.grey,
        textColor: Colors.black,
      ),
      PlaceColor(
        id: "orange",
        name: "Orange",
        color: Colors.deepOrange,
        textColor: Colors.white,
      ),
      PlaceColor(
        id: "blue",
        name: "Blue",
        color: Colors.blue,
        textColor: Colors.black,
      ),
      PlaceColor(
        id: "red",
        name: "Red",
        color: Colors.red,
        textColor: Colors.white,
      ),
      PlaceColor(
        id: "yellow",
        name: "Yellow",
        color: Colors.yellow,
        textColor: Colors.black,
      ),
      PlaceColor(
        id: "purple",
        name: "Purple",
        color: Colors.deepPurple,
        textColor: Colors.white,
      ),
      PlaceColor(
        id: "green",
        name: "Green",
        color: Colors.green,
        textColor: Colors.black,
      ),
      PlaceColor(
        id: "black",
        name: "Black",
        color: Colors.black,
        textColor: Colors.white,
      ),
    ];
  }

  @override
  PlaceColor getPlaceColorById({String id}) {
    return getPlaceColors().firstWhere(
      (item) => item.id == id,
      orElse: () => getPlaceColors()[0],
    );
  }
}
