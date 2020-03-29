abstract class IsConnectedToNetworkUseCase {
  void startListening();

  void stopListening();

  Stream<bool> get isConnected;
}
