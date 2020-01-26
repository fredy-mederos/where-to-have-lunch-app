import 'package:rxdart/rxdart.dart';
import 'package:where_to_have_lunch/domain/models/user.dart';
import 'package:where_to_have_lunch/domain/repository/user_repository.dart';
import 'package:where_to_have_lunch/ui/base/bloc_base.dart';
import 'package:where_to_have_lunch/ui/base/bloc_error_handler.dart';
import 'package:where_to_have_lunch/ui/base/bloc_loading.dart';
import 'package:where_to_have_lunch/utils/logger.dart';

class LoginBloC with LoadingBloC, ErrorHandlerBloC implements BaseBloC {
  final UserRepository userRepository;
  final Logger logger;

  LoginBloC(this.userRepository, this.logger);

  PublishSubject<User> _onUserLoginController = PublishSubject();

  Stream<User> get onUserLogin => _onUserLoginController.stream;

  void login() async {
    isLoading = true;
    try {
      var user = await userRepository.login();
      _onUserLoginController.sinkAddSafe(user);
    } catch (ex) {
      logger.log(ex);
      onError(ex);
    }
    isLoading = false;
  }

  @override
  void dispose() {
    _onUserLoginController.close();
    disposeLoadingBloC();
    disposeErrorHandlerBloC();
  }
}
