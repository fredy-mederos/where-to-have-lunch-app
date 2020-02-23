import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:where_to_have_lunch/data/firebase/firestore_api.dart';
import 'package:where_to_have_lunch/data/firebase/place_mapper.dart';
import 'package:where_to_have_lunch/domain/models/place.dart';
import 'package:where_to_have_lunch/domain/repository/place_color_repostitory.dart';
import 'package:where_to_have_lunch/domain/repository/place_repository.dart';

class PlaceRepositoryFirebaseImpl implements PlaceRepository {
  static const String PLACES_COLLECTION = "places";

  final PlaceMapper placeMapper;
  FirestoreApi firestoreApi;

  PlaceRepositoryFirebaseImpl(this.placeMapper) {
    firestoreApi = FirestoreApi(PLACES_COLLECTION);
  }

  @override
  Future<List<Place>> getPlaces() async {
    final data = await firestoreApi.getDataCollection();
    return data.documents
        .map(
          (item) => placeMapper.placeFromMap(item.data, item.documentID),
        )
        .toList();
  }

  @override
  Future removePlace(Place place) async {
    await firestoreApi.removeDocument(place.id);
  }

  @override
  Future addPlace(Place place) async {
    await firestoreApi.addDocument(placeMapper.mapFrommPlace(place));
  }

  @override
  Future savePlace(Place place) async {
    await firestoreApi.updateDocument(
      placeMapper.mapFrommPlace(place),
      place.id,
    );
  }
}
