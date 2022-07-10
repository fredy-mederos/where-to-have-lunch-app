import 'package:equatable/equatable.dart';
import 'package:where_to_have_lunch/domain/models/place_color.dart';

class Place extends Equatable {
  String id;
  String name;
  String description;
  PlaceColor color;

  Place({
    required this.id,
    required this.name,
    required this.description,
    required this.color,
  });

  updateFromPlace({required Place place}) {
    this.name = place.name;
    this.description = place.description;
    this.color = place.color;
  }

  @override
  List<Object?> get props => [id, name, description, color];
}
