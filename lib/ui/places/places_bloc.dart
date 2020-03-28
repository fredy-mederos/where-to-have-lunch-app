import 'package:rxdart/rxdart.dart';
import 'package:where_to_have_lunch/domain/models/place.dart';
import 'package:where_to_have_lunch/domain/repository/place_repository.dart';
import 'package:where_to_have_lunch/ui/base/bloc/bloc_base.dart';
import 'package:where_to_have_lunch/ui/base/bloc/bloc_error_handler.dart';
import 'package:where_to_have_lunch/ui/base/bloc/bloc_loading.dart';

class PlacesBloC with LoadingBloC, ErrorHandlerBloC implements BaseBloC {
  final PlaceRepository _placeRepository;

  PlacesBloC(this._placeRepository);

  Subject<List<Place>> _placeController = BehaviorSubject();

  Stream<List<Place>> get placesStream => _placeController.stream;

  loadPlaces() async {
    isLoading = true;
    try {
      final places = await _placeRepository.getPlaces();
      _placeController.sinkAddSafe(places);
    } catch (ex) {
      print(ex);
      onError("Error Loading The Places!");
    }
    isLoading = false;
  }

  @override
  void dispose() {
    disposeLoadingBloC();
    disposeErrorHandlerBloC();
    _placeController.close();
  }
}
