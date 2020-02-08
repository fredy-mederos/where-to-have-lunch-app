import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';
import 'package:where_to_have_lunch/domain/models/place.dart';
import 'package:where_to_have_lunch/domain/models/place_color.dart';
import 'package:where_to_have_lunch/domain/repository/place_color_repostitory.dart';
import 'package:where_to_have_lunch/domain/repository/place_repository.dart';
import 'package:where_to_have_lunch/ui/base/bloc_base.dart';
import 'package:where_to_have_lunch/ui/base/bloc_loading.dart';

class AddPlaceBloC with LoadingBloC implements BaseBloC {
  final PlaceRepository _placeRepository;
  final PlaceColorRepository _placeColorRepository;

  AddPlaceBloC(this._placeRepository, this._placeColorRepository);

  Subject<bool> _onSavedController = BehaviorSubject();

  Stream<bool> get onSavedStream => _onSavedController.stream;

  List<PlaceColor> getColors() => _placeColorRepository.getPlaceColors();

  addPlace({
    @required String name,
    @required String description,
    @required PlaceColor placeColor,
  }) async {
    isLoading = true;
    await _placeRepository.savePlace(
      Place(
        id: Uuid().v4(),
        name: name,
        description: description,
        color: placeColor,
      ),
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
