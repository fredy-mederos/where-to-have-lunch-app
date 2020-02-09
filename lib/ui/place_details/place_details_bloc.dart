import 'package:flutter/foundation.dart';
import 'package:where_to_have_lunch/domain/models/place.dart';
import 'package:where_to_have_lunch/domain/repository/place_repository.dart';
import 'package:where_to_have_lunch/ui/base/bloc_base.dart';
import 'package:where_to_have_lunch/ui/base/bloc_loading.dart';

class PlaceDetailsBloC with LoadingBloC implements BaseBloC {
  final PlaceRepository _placeRepository;

  PlaceDetailsBloC(this._placeRepository);

  Future deleteItem({@required Place place}) async {
    isLoading = true;
    await _placeRepository.removePlace(place);
    isLoading = false;
  }

  @override
  void dispose() {
    disposeLoadingBloC();
  }
}
