import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:where_to_have_lunch/domain/models/place.dart';
import 'package:where_to_have_lunch/domain/repository/place_repository.dart';
import 'package:where_to_have_lunch/ui/base/viewmodel/base_viewmodel.dart';
import 'package:where_to_have_lunch/ui/base/viewmodel/error_handler_viewmodel.dart';

@Deprecated("Use Places Page with it's BloC")
class PlacesViewModel with ErrorHandlerViewModel implements BaseViewModel {
  final PlaceRepository _placeRepository;

  StreamSubscription<List<Place>>? subscription;

  PlacesViewModel(this._placeRepository);

  Subject<List<Place>> _placeController = BehaviorSubject();

  Stream<List<Place>> get placesStream => _placeController.stream;

  loadPlaces() {
    subscription = _placeRepository.getPlacesStream().listen(
      (data) {
        _placeController.sinkAddSafe(data);
      },
    );
  }

  @override
  void dispose() {
    disposeErrorHandlerViewModel();
    _placeController.close();
    subscription?.cancel();
  }
}
