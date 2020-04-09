import 'package:where_to_have_lunch/domain/usecase/is_connected_to_network_usecase.dart';
import 'package:where_to_have_lunch/ui/base/viewmodel/base_viewmodel.dart';

class NetworkErrorViewModel implements BaseViewModel {
  final IsConnectedToNetworkUseCase _isConnectedToNetworkUseCase;

  Stream<bool> get isConnected => _isConnectedToNetworkUseCase.isConnected;

  NetworkErrorViewModel(this._isConnectedToNetworkUseCase) {
    _isConnectedToNetworkUseCase.startListening();
  }

  @override
  void dispose() {
    _isConnectedToNetworkUseCase.stopListening();
  }
}
