import 'package:flutter/foundation.dart';
import 'package:kiwi/kiwi.dart';
import 'package:where_to_have_lunch/data/firebase/config_mapper.dart';
import 'package:where_to_have_lunch/data/firebase/configs_repository_firebase_impl.dart';
import 'package:where_to_have_lunch/data/firebase/place_mapper.dart';
import 'package:where_to_have_lunch/data/firebase/place_repository_firebase_impl.dart';
import 'package:where_to_have_lunch/data/firebase/user_mapper.dart';
import 'package:where_to_have_lunch/data/firebase/user_repository_firebase_impl.dart';
import 'package:where_to_have_lunch/data/is_connected_to_network_usecase_connectivity_impl.dart';
import 'package:where_to_have_lunch/data/place_color_repository_impl.dart';
import 'package:where_to_have_lunch/data/stub/configs_repository_stub_impl.dart';
import 'package:where_to_have_lunch/data/stub/is_connected_to_network_usecase_stub_impl.dart';
import 'package:where_to_have_lunch/data/stub/place_repository_stub_impl.dart';
import 'package:where_to_have_lunch/data/stub/user_repository_stub_impl.dart';
import 'package:where_to_have_lunch/di/viewmodel_provider.dart';
import 'package:where_to_have_lunch/domain/repository/configs_repository.dart';
import 'package:where_to_have_lunch/domain/repository/place_color_repostitory.dart';
import 'package:where_to_have_lunch/domain/repository/place_repository.dart';
import 'package:where_to_have_lunch/domain/repository/user_repository.dart';
import 'package:where_to_have_lunch/domain/usecase/is_connected_to_network_usecase.dart';
import 'package:where_to_have_lunch/ui/base/viewmodel/base_viewmodel.dart';
import 'package:where_to_have_lunch/ui/home/home_viewmodel.dart';
import 'package:where_to_have_lunch/ui/login/login_viewmodel.dart';
import 'package:where_to_have_lunch/ui/network_error/network_error_viewmodel.dart';
import 'package:where_to_have_lunch/ui/place_details/place_details_viewmodel.dart';
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
  static Injector instance;

  Container container = Container();

  ///Is the app in debug mode?
  bool isInDebugMode() {
    var debugMode = false;
    assert(debugMode = true);
    return debugMode;
  }

  ///returns the current instance of the logger
  Logger getLogger() => container.resolve();

  ///returns a new viewModel instance
  T getNewViewModel<T extends BaseViewModel>() => container.resolve();

  T getDependency<T>() => container.resolve();

  static init({@required Mode mode, @required Client client}) {
    if (instance == null) {
      instance = Injector._start(mode: mode, client: client);
    }
  }

  Injector._start({@required Mode mode, @required Client client}) {
    if (mode == Mode.STUB)
      _registerDemo(client);
    else if (mode == Mode.PROD) _registerProd(client);

    _registerCommon(client);
    _registerViewModels(client);
    _registerMappers(client);
  }

  _registerDemo(Client client) {
    container.registerSingleton<UserRepository, UserRepositoryStubImpl>(
      (_) => UserRepositoryStubImpl(),
    );
    container.registerSingleton<PlaceRepository, PlaceRepositoryStubImpl>(
      (c) => PlaceRepositoryStubImpl(c.resolve(), c.resolve()),
    );
    container.registerSingleton<ConfigsRepository, ConfigsRepositoryStubImpl>(
      (_) => ConfigsRepositoryStubImpl(),
    );
    container.registerFactory<IsConnectedToNetworkUseCase, IsConnectedToNetworkUseCaseStubImpl>(
      (_) => IsConnectedToNetworkUseCaseStubImpl(),
    );
  }

  _registerProd(Client client) {
    container.registerSingleton<UserRepository, UserRepositoryFirebaseImpl>(
      (c) => UserRepositoryFirebaseImpl(c.resolve(), c.resolve()),
    );
    container.registerSingleton<PlaceRepository, PlaceRepositoryFirebaseImpl>(
      (c) => PlaceRepositoryFirebaseImpl(c.resolve()),
    );
    container.registerSingleton<ConfigsRepository, ConfigsRepositoryFirebaseImpl>(
      (c) => ConfigsRepositoryFirebaseImpl(c.resolve()),
    );
    container.registerFactory<IsConnectedToNetworkUseCase, IsConnectedToNetworkUseCaseConnectivityImpl>(
      (_) => IsConnectedToNetworkUseCaseConnectivityImpl(),
    );
  }

  _registerMappers(Client client) {
    container.registerFactory((_) => UserMapper());
    container.registerFactory((c) => PlaceMapper(c.resolve()));
    container.registerFactory((_) => ConfigMapper());
  }

  _registerViewModels(Client client) {
    container.registerFactory((c) => LoginViewModel(c.resolve(), c.resolve()));
    container.registerFactory((c) => SplashViewModel(c.resolve()));
    container.registerFactory((_) => HomeViewModel());
    container.registerFactory((c) => SettingsViewModel(c.resolve(), c.resolve(), c.resolve()));
    container.registerFactory((c) => SavePlaceViewModel(c.resolve(), c.resolve(), c.resolve()));
    container.registerFactory((c) => ConfigsViewModel(c.resolve()));
    container.registerFactory((c) => PlacesViewModel(c.resolve()));
    container.registerFactory((c) => PlaceDetailsViewModel(c.resolve()));
    container.registerFactory((c) => NetworkErrorViewModel(c.resolve()));
  }

  _registerCommon(Client client) {
    if (isInDebugMode()) {
      container.registerFactory<Logger, LoggerImpl>((_) => LoggerImpl());
    } else {
      container.registerFactory<Logger, LoggerEmptyImpl>(
        (_) => LoggerEmptyImpl(),
      );
    }

    container.registerFactory<PlaceColorRepository, PlaceColorRepositoryImpl>(
      (_) => PlaceColorRepositoryImpl(),
    );
  }
}

enum Mode { STUB, PROD }

enum Client { WEB, MOBILE }
