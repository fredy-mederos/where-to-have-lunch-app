import 'package:rxdart/rxdart.dart';
import 'package:where_to_have_lunch/domain/models/configs.dart';
import 'package:where_to_have_lunch/domain/repository/configs_repository.dart';
import 'package:where_to_have_lunch/ui/base/bloc_base.dart';

class ConfigsBloC implements BaseBloC {
  final ConfigsRepository _configsRepository;

  ConfigsBloC(this._configsRepository);

  Subject<Configs> _configsController = BehaviorSubject();

  Stream<Configs> get configsStream => _configsController.stream;

  loadConfigs() async {
    final configs = await _configsRepository.getConfigs();
    _configsController.sinkAddSafe(configs);
  }

  setDarkMode({bool darkMode}) async {
    await _configsRepository.setDarkMode(darkMode: darkMode);
    loadConfigs();
  }

  @override
  void dispose() {
    _configsController.close();
  }
}
