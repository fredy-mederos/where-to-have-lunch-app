import 'package:flutter/foundation.dart';
import 'package:where_to_have_lunch/domain/models/configs.dart';

abstract class ConfigsRepository {
  Future<Configs> getConfigs();

  Future setDarkMode({@required bool darkMode});
}
