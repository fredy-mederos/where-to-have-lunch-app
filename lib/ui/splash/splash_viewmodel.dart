import 'package:where_to_have_lunch/domain/repository/user_repository.dart';
import 'package:where_to_have_lunch/ui/base/viewmodel/base_viewmodel.dart';

class SplashViewModel extends BaseViewModel {
  final UserRepository userRepository;

  SplashViewModel(this.userRepository);

  Future<bool> isLoggedIn() async {
    var currentUser = await userRepository.currentUser();
    return currentUser != null;
  }

  @override
  void dispose() {}
}
