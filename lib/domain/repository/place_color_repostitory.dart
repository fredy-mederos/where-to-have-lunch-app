import 'package:flutter/foundation.dart';
import 'package:where_to_have_lunch/domain/models/place_color.dart';

abstract class PlaceColorRepository {

  PlaceColor defaultPlaceColor();

  List<PlaceColor> getPlaceColors();

  PlaceColor getPlaceColorById({required String id});
}
