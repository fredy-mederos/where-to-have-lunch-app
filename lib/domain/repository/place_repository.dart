import 'package:where_to_have_lunch/domain/models/place.dart';

abstract class PlaceRepository {
  Future<List<Place>> getPlaces();

  Stream<List<Place>> getPlacesStream();

  Future savePlace(Place place);

  Future addPlace(Place place);

  Future removePlace(Place place);

  Future logOut();
}
