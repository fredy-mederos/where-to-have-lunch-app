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
import 'package:where_to_have_lunch/domain/repository/configs_repository.dart';
import 'package:where_to_have_lunch/domain/repository/place_color_repostitory.dart';
import 'package:where_to_have_lunch/domain/repository/place_repository.dart';
import 'package:where_to_have_lunch/domain/repository/user_repository.dart';
import 'package:where_to_have_lunch/domain/usecase/is_connected_to_network_usecase.dart';
import 'package:where_to_have_lunch/ui/home/home_bloc.dart';
import 'package:where_to_have_lunch/ui/login/login_bloc.dart';
import 'package:where_to_have_lunch/ui/network_error/network_error_bloc.dart';
import 'package:where_to_have_lunch/ui/place_details/place_details_bloc.dart';
import 'package:where_to_have_lunch/ui/places/places_bloc.dart';
import 'package:where_to_have_lunch/ui/save_place/save_place_bloc.dart';
import 'package:where_to_have_lunch/ui/settings/configs_bloc.dart';
import 'package:where_to_have_lunch/ui/settings/settings_bloc.dart';
import 'package:where_to_have_lunch/ui/splash/splash_bloc.dart';
import 'package:where_to_have_lunch/utils/logger.dart';

import '../ui/base/bloc/bloc_base.dart';

///Part dependency injector engine and Part service locator.
///The main purpose of [Injector] is to provide bloCs instances and initialize the app components depending the current scope.
///To reuse a bloc instance in the widget's tree feel free to use the [BlocProvider] mechanism.
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

  ///returns a new bloc instance
  T getNewBloc<T extends BaseBloC>() => container.resolve();

  T getDependency<T>() => container.resolve();

  static initDemo() {
    if (instance == null) {
      instance = Injector._startDemo();
    }
  }

  static initProd() {
    if (instance == null) {
      instance = Injector._startProd();
    }
  }

  Injector._startDemo() {
    _registerDemo();
    _initialize();
  }

  Injector._startProd() {
    _registerProd();
    _initialize();
  }

  _initialize() {
    _registerCommon();
    _registerBloCs();
    _registerMappers();
  }

  _registerDemo() {
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

  _registerProd() {
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

  _registerMappers() {
    container.registerFactory((_) => UserMapper());
    container.registerFactory((c) => PlaceMapper(c.resolve()));
    container.registerFactory((_) => ConfigMapper());
  }

  _registerBloCs() {
    container.registerFactory((c) => LoginBloC(c.resolve(), c.resolve()));
    container.registerFactory((c) => SplashBloC(c.resolve()));
    container.registerFactory((_) => HomeBloC());
    container.registerFactory((c) => SettingsBloC(c.resolve(), c.resolve()));
    container.registerFactory((c) => SavePlaceBloC(c.resolve(), c.resolve(), c.resolve()));
    container.registerFactory((c) => ConfigsBloC(c.resolve()));
    container.registerFactory((c) => PlacesBloC(c.resolve()));
    container.registerFactory((c) => PlaceDetailsBloC(c.resolve()));
    container.registerFactory((c) => NetworkErrorBloC(c.resolve()));
  }

  _registerCommon() {
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
