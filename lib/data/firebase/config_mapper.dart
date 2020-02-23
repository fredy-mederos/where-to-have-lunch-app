import 'package:where_to_have_lunch/domain/models/configs.dart';

class ConfigMapper {
  static const String FIELD_DARK_MODE = "darkMode";

  Configs configsFromMap(Map map) => Configs(
        darkMode: map[FIELD_DARK_MODE] ?? false,
      );

  Map<String, dynamic> mapFromConfig(Configs configs) => {
        FIELD_DARK_MODE: configs.darkMode,
      };
}
