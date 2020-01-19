import 'dart:io';

import 'package:kiwi/kiwi.dart';
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
}
