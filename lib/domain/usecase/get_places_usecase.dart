import 'package:where_to_have_lunch/domain/models/place.dart';

abstract class GetPlacesUseCase {
  Stream<Place> getPlaces();
}
