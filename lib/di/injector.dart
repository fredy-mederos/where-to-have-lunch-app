import 'package:kiwi/kiwi.dart';
import 'package:where_to_have_lunch/data/firebase/user_mapper.dart';
import 'package:where_to_have_lunch/data/firebase/user_repository_firebase_impl.dart';
import 'package:where_to_have_lunch/data/stub/configs_repository_stub_impl.dart';
import 'package:where_to_have_lunch/data/stub/place_repository_stub_impl.dart';
import 'package:where_to_have_lunch/data/stub/user_repository_stub_impl.dart';
import 'package:where_to_have_lunch/domain/repository/configs_repository.dart';
import 'package:where_to_have_lunch/domain/repository/place_repository.dart';
import 'package:where_to_have_lunch/domain/repository/user_repository.dart';
import 'package:where_to_have_lunch/ui/add_place/add_place_bloc.dart';
import 'package:where_to_have_lunch/ui/home/home_bloc.dart';
import 'package:where_to_have_lunch/ui/login/login_bloc.dart';
import 'package:where_to_have_lunch/ui/settings/configs_bloc.dart';
import 'package:where_to_have_lunch/ui/settings/settings_bloc.dart';
import 'package:where_to_have_lunch/ui/splash/splash_bloc.dart';
import 'package:where_to_have_lunch/utils/logger.dart';

import '../ui/base/bloc_base.dart';

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
      (c) => UserRepositoryStubImpl(),
    );
    container.registerSingleton<PlaceRepository, PlaceRepositoryStubImpl>(
      (c) => PlaceRepositoryStubImpl(c.resolve()),
    );
    container.registerSingleton<ConfigsRepository, ConfigsRepositoryStubImpl>(
      (c) => ConfigsRepositoryStubImpl(),
    );
  }

  _registerProd() {
    container.registerSingleton<UserRepository, UserRepositoryFirebaseImpl>(
      (c) => UserRepositoryFirebaseImpl(c.resolve(), c.resolve()),
    );
  }

  _registerMappers() {
    container.registerFactory((c) => UserMapper());
  }

  _registerBloCs() {
    container.registerFactory((c) => LoginBloC(c.resolve(), c.resolve()));
    container.registerFactory((c) => SplashBloC(c.resolve()));
    container.registerFactory((c) => HomeBloC());
    container.registerFactory((c) => SettingsBloC(c.resolve()));
    container.registerFactory((c) => AddPlaceBloC(c.resolve()));
    container.registerFactory((c) => ConfigsBloC(c.resolve()));
  }

  _registerCommon() {
    if (isInDebugMode())
      container.registerSingleton<Logger, LoggerImpl>((c) => LoggerImpl());
    else
      container
          .registerSingleton<Logger, LoggerEmptyImpl>((c) => LoggerEmptyImpl());
  }
}
