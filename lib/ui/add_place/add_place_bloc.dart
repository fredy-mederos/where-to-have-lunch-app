import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';
import 'package:where_to_have_lunch/domain/models/place.dart';
import 'package:where_to_have_lunch/domain/repository/place_repository.dart';
import 'package:where_to_have_lunch/ui/base/bloc_base.dart';
import 'package:where_to_have_lunch/ui/base/bloc_loading.dart';

class AddPlaceBloC with LoadingBloC implements BaseBloC {
  final PlaceRepository _placeRepository;

  AddPlaceBloC(this._placeRepository);

  Subject<bool> _onSavedController = BehaviorSubject();

  Stream<bool> get onSavedStream => _onSavedController.stream;

  addPlace({String name, String description}) async {
    isLoading = true;
    await _placeRepository.savePlace(
      Place(id: Uuid().v4(), name: name, description: description),
    );
    _onSavedController.sinkAddSafe(true);
    //isLoading = false;
  }

  @override
  void dispose() {
    _onSavedController.close();
    disposeLoadingBloC();
  }
}
