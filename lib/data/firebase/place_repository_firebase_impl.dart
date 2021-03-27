import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/subjects.dart';
import 'package:where_to_have_lunch/data/firebase/auth_repository_impl.dart';
import 'package:where_to_have_lunch/data/firebase/firestore_api.dart';
import 'package:where_to_have_lunch/data/firebase/place_mapper.dart';
import 'package:where_to_have_lunch/domain/models/place.dart';
import 'package:where_to_have_lunch/domain/repository/place_repository.dart';

class PlaceRepositoryFirebaseImpl extends FirebaseAuthRepositoryImpl implements PlaceRepository {
  static const String PLACES_COLLECTION = "places";
  static const String USERS_COLLECTION = "users";

  final PlaceMapper placeMapper;
  FirestoreApi? _firestoreApi;

  // ignore: close_sinks
  final BehaviorSubject<List<Place>> placesController = BehaviorSubject.seeded(
    <Place>[],
  );

  PlaceRepositoryFirebaseImpl(this.placeMapper) {
    loadData();
  }

  void loadData() async {
    final api = await getApi();
    api.streamDataCollection().listen((data) {
      final places = data.docs.map((item) => placeMapper.placeFromMap(item.data() ?? {}, item.id)).toList();
      placesController.sink.add(places);
    });
  }

  Future<FirestoreApi> getApi() async {
    if (_firestoreApi != null) return _firestoreApi!;

    String? userId = (await getAuth()).currentUser?.uid;
    if (userId == null) throw Exception("No User");
    _firestoreApi = FirestoreApi(
      USERS_COLLECTION + "/" + userId + "/" + PLACES_COLLECTION,
    );
    return _firestoreApi!;
  }

  @override
  Future<List<Place>> getPlaces() async {
    final api = await getApi();
    final data = await api.getDataCollection();
    return data.docs
        .map(
          (item) => placeMapper.placeFromMap(item.data() ?? {}, item.id),
        )
        .toList();
  }

  @override
  Stream<List<Place>> getPlacesStream() => placesController.stream;

  @override
  Future removePlace(Place place) async {
    final api = await getApi();
    api.removeDocument(place.id);
  }

  @override
  Future addPlace(Place place) async {
    final api = await getApi();
    api.addDocument(placeMapper.mapFrommPlace(place));
  }

  @override
  Future savePlace(Place place) async {
    final api = await getApi();
    api.updateDocument(
      placeMapper.mapFrommPlace(place),
      place.id,
    );
  }

  @override
  Future logOut() async {
    _firestoreApi = null;
  }
}
