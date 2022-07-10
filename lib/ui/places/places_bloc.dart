import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_to_have_lunch/domain/models/place.dart';
import 'package:where_to_have_lunch/domain/repository/place_repository.dart';

class PlacesBloC extends BlocBase<PlacesPageState> {
  final PlaceRepository _placeRepository;
  StreamSubscription? subscription;

  PlacesBloC(this._placeRepository) : super(PlacesPageState.empty()) {
    _loadData();
  }

  _loadData() {
    subscription = _placeRepository.getPlacesStream().listen((places) {
      emit(state.copyWith(places: List.of(places), error: null));
    });
  }

  @override
  Future<void> close() async {
    subscription?.cancel();
    return await super.close();
  }
}

class PlacesPageState extends Equatable {
  late final List<Place> places;
  late final String? error;

  PlacesPageState.empty() {
    places = [];
    error = null;
  }

  PlacesPageState({
    required this.places,
    required this.error,
  });

  PlacesPageState copyWith({
    List<Place>? places,
    String? error,
  }) =>
      PlacesPageState(
        places: places ?? this.places,
        error: error ?? this.error,
      );

  @override
  List<Object?> get props => [places, error];
}
