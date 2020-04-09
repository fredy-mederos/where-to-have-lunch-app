import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:where_to_have_lunch/di/injector.dart';
import 'package:where_to_have_lunch/domain/models/configs.dart';
import 'package:where_to_have_lunch/domain/repository/configs_repository.dart';
import 'package:where_to_have_lunch/ui/base/viewmodel/base_viewmodel.dart';

class ConfigsViewModel implements BaseViewModel {
  final DependencyProvider<ConfigsRepository> _configsRepository;

  StreamSubscription<Configs> subscription;

  ConfigsViewModel(this._configsRepository);

  Subject<Configs> _configsController = BehaviorSubject();

  Stream<Configs> get configsStream => _configsController.stream;

  loadConfigs() async {
    subscription?.cancel();
    subscription = _configsRepository().getConfigsStream().listen((configs) {
      _configsController.sinkAddSafe(configs);
    });
  }

  setDarkMode({bool darkMode}) async {
    await _configsRepository().setDarkMode(darkMode: darkMode);
  }

  @override
  void dispose() {
    _configsController.close();
    subscription.cancel();
  }
}
