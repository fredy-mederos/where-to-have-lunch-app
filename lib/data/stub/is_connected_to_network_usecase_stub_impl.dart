import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:where_to_have_lunch/domain/usecase/is_connected_to_network_usecase.dart';
import 'package:where_to_have_lunch/utils/extensions.dart';

@Deprecated("Do not use this in production")
class IsConnectedToNetworkUseCaseStubImpl
    implements IsConnectedToNetworkUseCase {
  BehaviorSubject<bool> isConnectedController = BehaviorSubject<bool>();

  Stream<bool> get isConnected => isConnectedController.stream;

  @override
  void startListening() {
    isConnectedController.sinkAddSafe(true);
    Future.delayed(Duration(seconds: 3), () {
      isConnectedController.sinkAddSafe(false);
    });
  }

  @override
  void stopListening() {
    isConnectedController.close();
  }
}
