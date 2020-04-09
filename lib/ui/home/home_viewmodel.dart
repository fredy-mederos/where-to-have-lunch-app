import 'package:where_to_have_lunch/ui/base/viewmodel/base_viewmodel.dart';
import 'package:where_to_have_lunch/ui/base/viewmodel/error_handler_viewmodel.dart';
import 'package:where_to_have_lunch/ui/base/viewmodel/loading_viewmodel.dart';

class HomeViewModel with LoadingViewModel, ErrorHandlerViewModel implements BaseViewModel {
  @override
  void dispose() {
    disposeErrorHandlerViewModel();
    disposeLoadingViewModel();
  }
}
