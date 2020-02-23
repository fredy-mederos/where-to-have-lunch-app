import 'package:where_to_have_lunch/domain/models/place.dart';
import 'package:where_to_have_lunch/domain/repository/place_color_repostitory.dart';

class PlaceMapper {
  final PlaceColorRepository _placeColorRepository;

  static const String FIELD_NAME = "name";
  static const String FILED_DESCRIPTION = "description";
  static const String FIELD_COLOR = "color";

  PlaceMapper(this._placeColorRepository);

  Place placeFromMap(Map map, String id) => Place(
        id: id,
        name: map[FIELD_NAME],
        description: map[FILED_DESCRIPTION],
        color: _placeColorRepository.getPlaceColorById(id: map[FIELD_COLOR]),
      );

  Map<String, dynamic> mapFrommPlace(Place place) => {
        FIELD_NAME: place.name,
        FILED_DESCRIPTION: place.description,
        FIELD_COLOR: place.color.id,
      };
}
