import 'package:uuid/uuid.dart';
import 'package:where_to_have_lunch/domain/models/place.dart';
import 'package:where_to_have_lunch/domain/repository/place_color_repostitory.dart';
import 'package:where_to_have_lunch/domain/repository/place_repository.dart';
import 'package:where_to_have_lunch/utils/logger.dart';

@Deprecated("Do not use this in production")
class PlaceRepositoryStubImpl implements PlaceRepository {
  final Logger logger;
  final PlaceColorRepository placeColorRepository;

  PlaceRepositoryStubImpl(this.logger, this.placeColorRepository);

  var places = <Place>[];

  @override
  Future<List<Place>> getPlaces() {
    return Future.delayed(
      Duration(seconds: 2),
      () => new List.from(places),
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
    place.id = Uuid().v4();
    places.add(place);
  }

  @override
  Future savePlace(Place place) {
    return Future.delayed(Duration(seconds: 2), () {
      final index = places.indexWhere((item) => item.id == place.id);
      if (index != -1) {
        places.removeAt(index);
        places.insert(index, place);
      }
    });
  }

  @override
  Future logOut() {
    places = <Place>[];
  }
}
