import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:where_to_have_lunch/data/demo/place_repository_demo_impl.dart';
import 'package:where_to_have_lunch/data/demo/user_repository_demo_impl.dart';
import 'package:where_to_have_lunch/data/firebase/config_mapper.dart';
import 'package:where_to_have_lunch/data/firebase/configs_repository_firebase_impl.dart';
import 'package:where_to_have_lunch/data/firebase/place_mapper.dart';
import 'package:where_to_have_lunch/data/firebase/place_repository_firebase_impl.dart';
import 'package:where_to_have_lunch/data/firebase/user_mapper.dart';
import 'package:where_to_have_lunch/data/firebase/user_repository_firebase_impl.dart';
import 'package:where_to_have_lunch/data/is_connected_to_network_usecase_connectivity_impl.dart';
import 'package:where_to_have_lunch/data/place_color_repository_impl.dart';
import 'package:where_to_have_lunch/data/reset_app_mode_usecase_impl.dart';
import 'package:where_to_have_lunch/data/stub/configs_repository_stub_impl.dart';
import 'package:where_to_have_lunch/data/stub/is_connected_to_network_usecase_stub_impl.dart';
import 'package:where_to_have_lunch/data/stub/place_repository_stub_impl.dart';
import 'package:where_to_have_lunch/data/stub/reset_app_mode_usecase_stub_impl.dart';
import 'package:where_to_have_lunch/data/stub/user_repository_stub_impl.dart';
import 'package:where_to_have_lunch/di/viewmodel_provider.dart';
import 'package:where_to_have_lunch/domain/repository/configs_repository.dart';
import 'package:where_to_have_lunch/domain/repository/place_color_repostitory.dart';
import 'package:where_to_have_lunch/domain/repository/place_repository.dart';
import 'package:where_to_have_lunch/domain/repository/user_repository.dart';
import 'package:where_to_have_lunch/domain/usecase/is_connected_to_network_usecase.dart';
import 'package:where_to_have_lunch/domain/usecase/reset_app_mode_usecase.dart';
import 'package:where_to_have_lunch/ui/base/viewmodel/base_viewmodel.dart';
import 'package:where_to_have_lunch/ui/home/home_viewmodel.dart';
import 'package:where_to_have_lunch/ui/login/login_viewmodel.dart';
import 'package:where_to_have_lunch/ui/network_error/network_error_viewmodel.dart';
import 'package:where_to_have_lunch/ui/place_details/place_details_viewmodel.dart';
import 'package:where_to_have_lunch/ui/places/places_bloc.dart';
import 'package:where_to_have_lunch/ui/places/places_viewmodel.dart';
import 'package:where_to_have_lunch/ui/save_place/save_place_viewmodel.dart';
import 'package:where_to_have_lunch/ui/settings/configs_viewmodel.dart';
import 'package:where_to_have_lunch/ui/settings/settings_viewmodel.dart';
import 'package:where_to_have_lunch/ui/splash/splash_viewmodel.dart';
import 'package:where_to_have_lunch/utils/logger.dart';

///Part dependency injector engine and Part service locator.
///The main purpose of [Injector] is to provide viewModels instances and initialize the app components depending the current scope.
///To reuse a viewModel instance in the widget's tree feel free to use the [ViewModelProvider] mechanism.
class Injector {
  ///Singleton instance
  static Injector? instance;

  KiwiContainer _container = KiwiContainer();

  Client? _currentClient;

  ///Is the app in debug mode?
  bool isInDebugMode() {
    var debugMode = false;
    assert(debugMode = true);
    return debugMode;
  }

  ///returns the current instance of the logger
  Logger getLogger() => _container.resolve();

  ///returns a new viewModel instance
  T getNewViewModel<T extends BaseViewModel>() => _container.resolve();

  B getNewBloC<B extends BlocBase>() => _container.resolve();

  T getDependency<T>() => _container.resolve();

  static resetMode({required Mode mode}) {
    instance?._container.clear();
    instance?._registerDeps(mode: mode, client: instance?._currentClient ?? Client.MOBILE);
  }

  static init({required Mode mode, required Client client}) {
    if (instance == null) {
      instance = Injector._start(mode: mode, client: client);
    }
  }

  Injector._start({required Mode mode, required Client client}) {
    _registerDeps(mode: mode, client: client);
  }

  _registerDeps({required Mode mode, required Client client}) {
    _currentClient = client;

    if (mode == Mode.STUB) _registerStub(client);
    else if (mode == Mode.PROD) _registerProd(client);
    else if (mode == Mode.DEMO) _registerDemo(client);

    _registerCommon(client);
    _registerViewModels(client);
    _registerBloCs(client);
    _registerMappers(client);
  }

  _registerDemo(Client client) {
    _container.registerSingleton<UserRepository>(
      (_) => UserRepositoryDemoImpl(),
    );
    _container.registerSingleton<PlaceRepository>(
      (c) => PlaceRepositoryDemoImpl(c.resolve(), c.resolve()),
    );
    _container.registerSingleton<ConfigsRepository>(
      (_) => ConfigsRepositoryStubImpl(),
    );
    _container.registerFactory<IsConnectedToNetworkUseCase>(
      (_) => IsConnectedToNetworkUseCaseConnectivityImpl(),
    );
    _container.registerFactory<ResetAppModeUseCase>(
      (_) => ResetAppModeUseCaseImpl(),
    );
  }

  _registerStub(Client client) {
    _container.registerSingleton<UserRepository>(
      (_) => UserRepositoryStubImpl(),
    );
    _container.registerSingleton<PlaceRepository>(
      (c) => PlaceRepositoryStubImpl(c.resolve(), c.resolve()),
    );
    _container.registerSingleton<ConfigsRepository>(
      (_) => ConfigsRepositoryStubImpl(),
    );
    _container.registerFactory<IsConnectedToNetworkUseCase>(
      (_) => IsConnectedToNetworkUseCaseStubImpl(),
    );
    _container.registerFactory<ResetAppModeUseCase>(
      (_) => ResetAppModeUseCaseStubImpl(),
    );
  }

  _registerProd(Client client) {
    _container.registerSingleton<UserRepository>(
      (c) => UserRepositoryFirebaseImpl(c.resolve(), c.resolve()),
    );
    _container.registerSingleton<PlaceRepository>(
      (c) => PlaceRepositoryFirebaseImpl(c.resolve()),
    );
    _container.registerSingleton<ConfigsRepository>(
      (c) => ConfigsRepositoryFirebaseImpl(c.resolve()),
    );
    _container.registerFactory<IsConnectedToNetworkUseCase>(
      (_) => IsConnectedToNetworkUseCaseConnectivityImpl(),
    );
    _container.registerFactory<ResetAppModeUseCase>(
      (_) => ResetAppModeUseCaseImpl(),
    );
  }

  _registerMappers(Client client) {
    _container.registerFactory((_) => UserMapper());
    _container.registerFactory((c) => PlaceMapper(c.resolve()));
    _container.registerFactory((_) => ConfigMapper());
  }

  _registerViewModels(Client client) {
    _container.registerFactory((c) => LoginViewModel(() => c.resolve(), c.resolve(), c.resolve()));
    _container.registerFactory((c) => SplashViewModel(c.resolve()));
    _container.registerFactory((_) => HomeViewModel());
    _container.registerFactory((c) => SettingsViewModel(c.resolve(), c.resolve(), c.resolve()));
    _container.registerFactory((c) => SavePlaceViewModel(c.resolve(), c.resolve(), c.resolve()));
    _container.registerFactory((c) => ConfigsViewModel(() => c.resolve()));
    _container.registerFactory((c) => PlacesViewModel(c.resolve()));
    _container.registerFactory((c) => PlaceDetailsViewModel(c.resolve()));
    _container.registerFactory((c) => NetworkErrorViewModel(c.resolve()));
  }

  _registerBloCs(Client client){
    _container.registerFactory((c) => PlacesBloC(c.resolve()));
  }

  _registerCommon(Client client) {
    if (isInDebugMode()) {
      _container.registerFactory<Logger>((_) => LoggerImpl());
    } else {
      _container.registerFactory<Logger>(
        (_) => LoggerEmptyImpl(),
      );
    }

    _container.registerFactory<PlaceColorRepository>(
      (_) => PlaceColorRepositoryImpl(),
    );
  }
}

typedef DependencyProvider<T> = T Function();

enum Mode { STUB, PROD, DEMO }

enum Client { WEB, MOBILE }
