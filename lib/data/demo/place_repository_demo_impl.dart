import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';
import 'package:where_to_have_lunch/domain/models/place.dart';
import 'package:where_to_have_lunch/domain/models/place_color.dart';
import 'package:where_to_have_lunch/domain/repository/place_color_repostitory.dart';
import 'package:where_to_have_lunch/domain/repository/place_repository.dart';
import 'package:where_to_have_lunch/utils/extensions.dart';
import 'package:where_to_have_lunch/utils/logger.dart';

class PlaceRepositoryDemoImpl implements PlaceRepository {
  final Logger logger;
  final PlaceColorRepository placeColorRepository;

  // ignore: close_sinks
  final BehaviorSubject<List<Place>> placesController = BehaviorSubject.seeded(
    <Place>[
      Place(
        id: "1",
        name: "Demo Place",
        description: "This is a demo place",
        color: PlaceColor(
          id: "orange",
          name: "Orange",
          color: Colors.deepOrange,
          textColor: Colors.white,
        ),
      )
    ],
  );

  PlaceRepositoryDemoImpl(this.logger, this.placeColorRepository);

  @override
  Future<List<Place>> getPlaces() async {
    return Future.delayed(Duration(seconds: 2), () async {
      return new List.from(placesController.stream.value);
    });
  }

  @override
  Future removePlace(Place place) {
    return Future.delayed(Duration(seconds: 0), () async {
      final places = placesController.stream.value;
      places.remove(place);
      placesController.sinkAddSafe(places);
    });
  }

  @override
  Future addPlace(Place place) {
    return Future.delayed(Duration(seconds: 2), () async {
      place.id = Uuid().v4();
      try {
        final places = placesController.stream.value;
        places.add(place);
        placesController.sinkAddSafe(places);
      } catch (ex) {
        print(ex);
      }
    });
  }

  @override
  Future savePlace(Place place) {
    return Future.delayed(Duration(seconds: 2), () async {
      final places = placesController.stream.value;
      final index = places.indexWhere((item) => item.id == place.id);
      if (index != -1) {
        places.removeAt(index);
        places.insert(index, place);
      }
      placesController.sinkAddSafe(places);
    });
  }

  @override
  Future logOut() async {}

  @override
  Stream<List<Place>> getPlacesStream() => placesController.stream;
}
