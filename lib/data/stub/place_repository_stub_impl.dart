import 'package:where_to_have_lunch/domain/models/place.dart';
import 'package:where_to_have_lunch/domain/repository/place_repository.dart';
import 'package:where_to_have_lunch/utils/logger.dart';

class PlaceRepositoryStubImpl implements PlaceRepository {
  final Logger logger;

  PlaceRepositoryStubImpl(this.logger);

  var places = [
    Place(id: "1", name: "My Place", description: "Such a nice place"),
  ];

  @override
  Future<List<Place>> getPlaces() {
    return Future.delayed(
      Duration(seconds: 2),
      () => places,
    );
  }

  @override
  Future removePlace(Place place) {
    return Future.delayed(Duration(seconds: 1), () {
      places.remove(place);
    });
  }

  @override
  Future savePlace(Place place) {
    return Future.delayed(Duration(seconds: 2), () {
      if (!places.contains(place)) {
        places.add(place);
        logger.log("Place added '${place.name}'");
      }
    });
  }
}
