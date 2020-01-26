import 'dart:io';

import 'package:kiwi/kiwi.dart';
import 'package:where_to_have_lunch/data/firebase/user_repository_firebase_impl.dart';
import 'package:where_to_have_lunch/data/stub/user_repository_stub_impl.dart';
import 'package:where_to_have_lunch/di/stub_features.dart';
import 'package:where_to_have_lunch/domain/repository/user_repository.dart';
import 'package:where_to_have_lunch/ui/home/home_bloc.dart';
import 'package:where_to_have_lunch/ui/login/login_bloc.dart';
import 'package:where_to_have_lunch/ui/splash/splash_bloc.dart';
import 'package:where_to_have_lunch/ui/splash/splash_page.dart';
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

  List<StubFeatures> _stubFeatures = [];

  static initDemo({List<StubFeatures> stubFeatures}) {
    if (instance == null) {
      instance = Injector._startDemo(stubFeatures: stubFeatures);
    }
  }

  static initProd() {
    if (instance == null) {
      instance = Injector._startProd();
    }
  }

  Injector._startDemo({List<StubFeatures> stubFeatures}) {
    this._stubFeatures = stubFeatures ?? [];
    _initialize();
  }

  Injector._startProd() {
    _initialize();
  }

  _initialize() {
    _registerCommon();
    _registerRepositories();
    _registerBloCs();
  }

  _registerRepositories() {
    if (_stubFeatures.contains(StubFeatures.USER))
      container.registerSingleton<UserRepository, UserRepositoryStubImpl>(
        (c) => UserRepositoryStubImpl(),
      );
    else
      container.registerSingleton<UserRepository, UserRepositoryFirebaseImpl>(
        (c) => UserRepositoryFirebaseImpl(c.resolve()),
      );
  }

  _registerBloCs() {
    container.registerFactory((c) => LoginBloC(c.resolve(), c.resolve()));
    container.registerFactory((c) => SplashBloC(c.resolve()));
    container.registerFactory((c) => HomeBloC());
  }

  _registerCommon() {
    if (isInDebugMode())
      container.registerSingleton<Logger, LoggerImpl>((c) => LoggerImpl());
    else
      container
          .registerSingleton<Logger, LoggerEmptyImpl>((c) => LoggerEmptyImpl());
  }
}
