import 'package:where_to_have_lunch/ui/base/bloc/bloc_base.dart';
import 'package:where_to_have_lunch/ui/base/bloc/bloc_error_handler.dart';
import 'package:where_to_have_lunch/ui/base/bloc/bloc_loading.dart';

class HomeBloC with LoadingBloC, ErrorHandlerBloC implements BaseBloC {
  @override
  void dispose() {
    disposeErrorHandlerBloC();
    disposeLoadingBloC();
  }
}
