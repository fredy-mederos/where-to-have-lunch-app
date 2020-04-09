import 'package:rxdart/rxdart.dart';
import 'package:where_to_have_lunch/di/injector.dart';
import 'package:where_to_have_lunch/domain/models/user.dart';
import 'package:where_to_have_lunch/domain/repository/user_repository.dart';
import 'package:where_to_have_lunch/domain/usecase/reset_app_mode_usecase.dart';
import 'package:where_to_have_lunch/ui/base/viewmodel/base_viewmodel.dart';
import 'package:where_to_have_lunch/ui/base/viewmodel/error_handler_viewmodel.dart';
import 'package:where_to_have_lunch/ui/base/viewmodel/loading_viewmodel.dart';
import 'package:where_to_have_lunch/utils/logger.dart';

class LoginViewModel with LoadingViewModel, ErrorHandlerViewModel implements BaseViewModel {
  final DependencyProvider<UserRepository> _userRepositoryProvider;
  final ResetAppModeUseCase _resetAppModeUseCase;
  final Logger logger;

  LoginViewModel(this._userRepositoryProvider, this.logger, this._resetAppModeUseCase);

  PublishSubject<User> _onUserLoginController = PublishSubject();

  Stream<User> get onUserLogin => _onUserLoginController.stream;

  void login() async {
    _resetAppModeUseCase.changeToProductionMode();
    await _login();
  }

  void enterInDemoMode() async {
    _resetAppModeUseCase.changeToDemoMode();
    await _login();
  }

  _login() async {
    isLoading = true;
    try {
      var user = await _userRepositoryProvider().login();
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
    disposeLoadingViewModel();
    disposeErrorHandlerViewModel();
  }
}
