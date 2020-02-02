import 'package:where_to_have_lunch/domain/models/configs.dart';
import 'package:where_to_have_lunch/domain/repository/configs_repository.dart';

class ConfigsRepositoryStubImpl implements ConfigsRepository {
  var configs = Configs(darkMode: false);

  @override
  Future<Configs> getConfigs() {
    return Future.delayed(Duration(seconds: 0), () => configs);
  }

  @override
  Future setDarkMode({bool darkMode}) async {
    return Future.delayed(Duration(seconds: 0), () {
      configs.darkMode = darkMode;
    });
  }
}
