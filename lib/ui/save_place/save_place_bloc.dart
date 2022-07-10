import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_to_have_lunch/domain/models/place.dart';
import 'package:where_to_have_lunch/domain/models/place_color.dart';
import 'package:where_to_have_lunch/domain/repository/place_color_repostitory.dart';
import 'package:where_to_have_lunch/domain/repository/place_repository.dart';

class SavePlaceBloC extends BlocBase<SavePlaceState> {

  final PlaceRepository _placeRepository;
  final PlaceColorRepository _placeColorRepository;

  SavePlaceBloC(this._placeRepository, this._placeColorRepository)
      : super(SavePlaceState(
          colors: _placeColorRepository.getPlaceColors(),
          currentPlace: null,
          loading: false,
          status: SaveStatus.EDITING,
        ));

  addPlace({
    String? id,
    required String name,
    required String description,
    PlaceColor? placeColor,
  }) async {
    emit(state.copyWith(loading: true));

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
    emit(state.copyWith(loading: false, status: SaveStatus.FINISHED, currentPlace: place));
  }
}

enum SaveStatus {
  EDITING,
  FINISHED,
}

class SavePlaceState extends Equatable {
  late final List<PlaceColor> colors;
  late final Place? currentPlace;
  late final bool loading;
  late final SaveStatus status;

  SavePlaceState({
    required this.colors,
    required this.currentPlace,
    required this.loading,
    required this.status,
  });

  SavePlaceState.empty() {
    colors = [];
    loading = false;
    currentPlace = null;
    status = SaveStatus.EDITING;
  }

  SavePlaceState copyWith({
    List<PlaceColor>? colors,
    Place? currentPlace,
    bool? loading,
    SaveStatus status = SaveStatus.EDITING,
  }) =>
      SavePlaceState(
        colors: colors ?? this.colors,
        currentPlace: currentPlace ?? this.currentPlace,
        loading: loading ?? this.loading,
        status: status,
      );

  @override
  List<Object?> get props => [colors, currentPlace, loading, status];
}
