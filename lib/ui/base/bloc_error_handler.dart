import 'dart:io';

import 'package:rxdart/rxdart.dart';
import 'package:where_to_have_lunch/utils/extensions.dart';

class ErrorHandlerBloC {
  BehaviorSubject<String> _errorMessageController = new BehaviorSubject();

  Stream<String> get errorMessageStream => _errorMessageController.stream;

  onError(dynamic error) {
    if (error != null)
      _errorMessageController.sinkAddSafe(getResponseError(error));
    else
      clearError();
  }

  String getResponseError(dynamic error) {
//    if (error is SocketException) {
//      return R.string.error_check_your_connection;
//    }
//    if (error is ServerException) {
//      return error.message;
//    } else {
//      return error.toString();
//    }
    return error.toString();
  }

  clearError() {
    _errorMessageController.sinkAddSafe(null);
  }

  void disposeErrorHandlerBloC() {
    print('Error Handler Dispose');
    _errorMessageController.close();
  }
}
