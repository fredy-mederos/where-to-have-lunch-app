import 'package:rxdart/rxdart.dart';
import 'package:where_to_have_lunch/utils/extensions.dart';

class LoadingViewModel {
  BehaviorSubject<bool> _loadingController = BehaviorSubject.seeded(false);

  Stream<bool> get isLoadingStream => _loadingController.stream;

  bool get isLoading => _loadingController.value!;

  set isLoading(bool loading) {
    _loadingController.sinkAddSafe(loading);
  }

  void disposeLoadingViewModel() {
    _loadingController.close();
  }
}
