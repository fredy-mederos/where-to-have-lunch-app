import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:where_to_have_lunch/domain/models/place.dart';
import 'package:where_to_have_lunch/domain/repository/place_repository.dart';
import 'package:where_to_have_lunch/ui/base/bloc/bloc_base.dart';
import 'package:where_to_have_lunch/ui/base/bloc/bloc_error_handler.dart';

class PlacesBloC with ErrorHandlerBloC implements BaseBloC {
  final PlaceRepository _placeRepository;

  StreamSubscription<List<Place>> subscription;

  PlacesBloC(this._placeRepository);

  Subject<List<Place>> _placeController = BehaviorSubject();

  Stream<List<Place>> get placesStream => _placeController.stream;

  loadPlaces() {
    try {
      subscription = _placeRepository.getPlacesStream().listen((data) {
        _placeController.sinkAddSafe(data);
      }, onError: () {
        onError("Error Loading The Places!");
      });
    } catch (ex) {
      print(ex);
    }
  }

  @override
  void dispose() {
    disposeErrorHandlerBloC();
    _placeController.close();
    subscription?.cancel();
  }
}
