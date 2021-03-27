import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';
import 'package:where_to_have_lunch/domain/models/place.dart';
import 'package:where_to_have_lunch/domain/repository/place_color_repostitory.dart';
import 'package:where_to_have_lunch/domain/repository/place_repository.dart';
import 'package:where_to_have_lunch/utils/extensions.dart';
import 'package:where_to_have_lunch/utils/logger.dart';

@Deprecated("Do not use this in production")
class PlaceRepositoryStubImpl implements PlaceRepository {
  final Logger logger;
  final PlaceColorRepository placeColorRepository;

  // ignore: close_sinks
  final BehaviorSubject<List<Place>> placesController = BehaviorSubject.seeded(
    <Place>[],
  );

  PlaceRepositoryStubImpl(this.logger, this.placeColorRepository);

  @override
  Future<List<Place>> getPlaces() async {
    return Future.delayed(Duration(seconds: 2), () async {
      return new List.from(placesController.stream.value!);
    });
  }

  @override
  Future removePlace(Place place) {
    return Future.delayed(Duration(seconds: 0), () async {
      final places = placesController.stream.value!;
      places.remove(place);
      placesController.sinkAddSafe(places);
    });
  }

  @override
  Future addPlace(Place place) async {
    place.id = Uuid().v4();
    try {
      final places = placesController.stream.value!;
      places.add(place);
      placesController.sinkAddSafe(places);
    } catch (ex) {
      print(ex);
    }
  }

  @override
  Future savePlace(Place place) {
    return Future.delayed(Duration(seconds: 2), () async {
      final places = placesController.stream.value!;
      final index = places.indexWhere((item) => item.id == place.id);
      if (index != -1) {
        places.removeAt(index);
        places.insert(index, place);
      }
      placesController.sinkAddSafe(places);
    });
  }

  @override
  Future logOut() async {
    placesController.sinkAddSafe(<Place>[]);
  }

  @override
  Stream<List<Place>> getPlacesStream() => placesController.stream;
}
