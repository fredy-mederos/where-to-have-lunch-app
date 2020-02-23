import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:where_to_have_lunch/domain/models/place.dart';
import 'package:where_to_have_lunch/domain/models/place_color.dart';
import 'package:where_to_have_lunch/domain/repository/place_color_repostitory.dart';
import 'package:where_to_have_lunch/domain/repository/place_repository.dart';
import 'package:where_to_have_lunch/ui/base/bloc_base.dart';
import 'package:where_to_have_lunch/ui/base/bloc_loading.dart';

class SavePlaceBloC with LoadingBloC implements BaseBloC {
  final PlaceRepository _placeRepository;
  final PlaceColorRepository _placeColorRepository;

  SavePlaceBloC(this._placeRepository, this._placeColorRepository);

  Subject<bool> _onSavedController = BehaviorSubject();

  Stream<bool> get onSavedStream => _onSavedController.stream;

  List<PlaceColor> getColors() => _placeColorRepository.getPlaceColors();

  addPlace({
    @required String id,
    @required String name,
    @required String description,
    @required PlaceColor placeColor,
  }) async {
    isLoading = true;

    final place = Place(
      id: id,
      name: name,
      description: description,
      color: placeColor,
    );
    if (id == null) {
      await _placeRepository.addPlace(place);
    } else {
      await _placeRepository.savePlace(place);
    }
    _onSavedController.sinkAddSafe(true);
    //isLoading = false;
  }

  @override
  void dispose() {
    _onSavedController.close();
    disposeLoadingBloC();
  }
}
