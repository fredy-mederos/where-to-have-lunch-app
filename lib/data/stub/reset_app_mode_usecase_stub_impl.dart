import 'package:where_to_have_lunch/di/injector.dart';
import 'package:where_to_have_lunch/domain/usecase/reset_app_mode_usecase.dart';

class ResetAppModeUseCaseStubImpl implements ResetAppModeUseCase {
  @override
  void changeToDemoMode() {
    Injector.resetMode(mode: Mode.STUB);
  }

  @override
  void changeToProductionMode() {
    Injector.resetMode(mode: Mode.STUB);
  }
}
