import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:rxdart/rxdart.dart';
import 'package:where_to_have_lunch/domain/usecase/is_connected_to_network_usecase.dart';
import 'package:where_to_have_lunch/utils/extensions.dart';

class IsConnectedToNetworkUseCaseConnectivityImpl implements IsConnectedToNetworkUseCase {
  BehaviorSubject<bool>? isConnectedController;
  StreamSubscription<ConnectivityResult>? subscription;

  Stream<bool> get isConnected => isConnectedController!.stream;

  @override
  void startListening() {
    isConnectedController = BehaviorSubject<bool>();
    subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        isConnectedController?.sinkAddSafe(result != ConnectivityResult.none);
      },
    );
  }

  @override
  void stopListening() {
    subscription?.cancel();
    isConnectedController?.close();
  }
}
