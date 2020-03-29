import 'package:rxdart/rxdart.dart';
import 'package:where_to_have_lunch/domain/models/configs.dart';
import 'package:where_to_have_lunch/domain/repository/configs_repository.dart';
import 'package:where_to_have_lunch/utils/extensions.dart';

@Deprecated("Do not use this in production")
class ConfigsRepositoryStubImpl implements ConfigsRepository {
  // ignore: close_sinks
  final BehaviorSubject<Configs> configsController =
      BehaviorSubject.seeded(Configs(darkMode: false));

  @override
  Future<Configs> getConfigs() {
    return Future.delayed(
      Duration(seconds: 0),
      () => configsController.stream.value,
    );
  }

  @override
  Future setDarkMode({bool darkMode}) async {
    return Future.delayed(Duration(seconds: 0), () {
      configsController.sinkAddSafe(Configs(darkMode: darkMode));
    });
  }

  @override
  Stream<Configs> getConfigsStream() => configsController.stream;
}
