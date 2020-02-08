import 'package:flutter/foundation.dart';
import 'package:where_to_have_lunch/domain/models/place_color.dart';

abstract class PlaceColorRepository {
  List<PlaceColor> getPlaceColors();

  PlaceColor getPlaceColorByName({@required String name});
}
