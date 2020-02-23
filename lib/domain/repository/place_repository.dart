import 'package:where_to_have_lunch/domain/models/place.dart';

abstract class PlaceRepository {
  Future<List<Place>> getPlaces();

  Future savePlace(Place place);

  Future addPlace(Place place);

  Future removePlace(Place place);

  Future logOut();
}
