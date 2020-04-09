import 'package:flutter/foundation.dart';
import 'package:where_to_have_lunch/domain/models/place.dart';
import 'package:where_to_have_lunch/domain/repository/place_repository.dart';
import 'package:where_to_have_lunch/ui/base/viewmodel/base_viewmodel.dart';
import 'package:where_to_have_lunch/ui/base/viewmodel/loading_viewmodel.dart';

class PlaceDetailsViewModel with LoadingViewModel implements BaseViewModel {
  final PlaceRepository _placeRepository;

  PlaceDetailsViewModel(this._placeRepository);

  Future deleteItem({@required Place place}) async {
    isLoading = true;
    await _placeRepository.removePlace(place);
    isLoading = false;
  }

  @override
  void dispose() {
    disposeLoadingViewModel();
  }
}
