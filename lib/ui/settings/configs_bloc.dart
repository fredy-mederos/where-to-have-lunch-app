import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:where_to_have_lunch/domain/models/configs.dart';
import 'package:where_to_have_lunch/domain/repository/configs_repository.dart';
import 'package:where_to_have_lunch/ui/base/bloc/bloc_base.dart';

class ConfigsBloC implements BaseBloC {
  final ConfigsRepository _configsRepository;

  StreamSubscription<Configs> subscription;

  ConfigsBloC(this._configsRepository);

  Subject<Configs> _configsController = BehaviorSubject();

  Stream<Configs> get configsStream => _configsController.stream;

  loadConfigs() async {
    subscription?.cancel();
    subscription = _configsRepository.getConfigsStream().listen((configs) {
      _configsController.sinkAddSafe(configs);
    });
  }

  setDarkMode({bool darkMode}) async {
    await _configsRepository.setDarkMode(darkMode: darkMode);
  }

  @override
  void dispose() {
    _configsController.close();
    subscription.cancel();
  }
}
