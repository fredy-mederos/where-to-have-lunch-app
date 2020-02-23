import 'package:where_to_have_lunch/domain/models/place.dart';
import 'package:where_to_have_lunch/domain/repository/place_color_repostitory.dart';
import 'package:where_to_have_lunch/domain/repository/place_repository.dart';
import 'package:where_to_have_lunch/utils/logger.dart';

class PlaceRepositoryStubImpl implements PlaceRepository {
  final Logger logger;
  final PlaceColorRepository placeColorRepository;

  PlaceRepositoryStubImpl(this.logger, this.placeColorRepository);

  var places = <Place>[];

  @override
  Future<List<Place>> getPlaces() {
    return Future.delayed(
      Duration(seconds: 2),
      () => places,
    );
  }

  @override
  Future removePlace(Place place) {
    return Future.delayed(Duration(seconds: 0), () {
      places.remove(place);
    });
  }

  @override
  Future addPlace(Place place) async {
    places.add(place);
  }

  @override
  Future savePlace(Place place) {
    return Future.delayed(Duration(seconds: 2), () {
      final oldPlace =
          places.firstWhere((item) => item.id == place.id, orElse: () => null);

      if (oldPlace == null) {
      } else {
        oldPlace.name = place.name;
        oldPlace.description = place.description;
        oldPlace.color = place.color;
      }
    });
  }
}
