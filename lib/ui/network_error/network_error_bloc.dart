import 'package:where_to_have_lunch/domain/usecase/is_connected_to_network_usecase.dart';
import 'package:where_to_have_lunch/ui/base/bloc/bloc_base.dart';

class NetworkErrorBloC implements BaseBloC {
  final IsConnectedToNetworkUseCase _isConnectedToNetworkUseCase;

  Stream<bool> get isConnected => _isConnectedToNetworkUseCase.isConnected;

  NetworkErrorBloC(this._isConnectedToNetworkUseCase) {
    _isConnectedToNetworkUseCase.startListening();
  }

  @override
  void dispose() {
    _isConnectedToNetworkUseCase.stopListening();
  }
}
