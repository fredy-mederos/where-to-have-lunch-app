import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:where_to_have_lunch/domain/models/place.dart';
import 'package:where_to_have_lunch/domain/models/place_color.dart';
import 'package:where_to_have_lunch/domain/repository/place_color_repostitory.dart';
import 'package:where_to_have_lunch/domain/repository/place_repository.dart';
import 'package:where_to_have_lunch/ui/base/viewmodel/base_viewmodel.dart';
import 'package:where_to_have_lunch/ui/base/viewmodel/loading_viewmodel.dart';
import 'package:where_to_have_lunch/utils/logger.dart';

class SavePlaceViewModel with LoadingViewModel implements BaseViewModel {
  final PlaceRepository _placeRepository;
  final PlaceColorRepository _placeColorRepository;
  final Logger _logger;

  SavePlaceViewModel(
    this._placeRepository,
    this._placeColorRepository,
    this._logger,
  );

  Subject<Place> _onSavedController = BehaviorSubject();

  Stream<Place> get onSavedStream => _onSavedController.stream;

  List<PlaceColor> getColors() => _placeColorRepository.getPlaceColors();

  addPlace({
    String? id,
    required String name,
    required String description,
    PlaceColor? placeColor,
  }) async {
    isLoading = true;

    final place = Place(
      id: id ?? "",
      name: name,
      description: description,
      color: placeColor ?? _placeColorRepository.defaultPlaceColor(),
    );
    if (id == null) {
      await _placeRepository.addPlace(place);
    } else {
      await _placeRepository.savePlace(place);
    }
    _onSavedController.sinkAddSafe(place);
    //isLoading = false;
  }

  @override
  void dispose() {
    _onSavedController.close();
    disposeLoadingViewModel();
  }
}
