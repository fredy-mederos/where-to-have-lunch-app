import 'package:where_to_have_lunch/domain/repository/user_repository.dart';
import 'package:where_to_have_lunch/ui/base/bloc_base.dart';

class SplashBloC extends BaseBloC {
  final UserRepository userRepository;

  SplashBloC(this.userRepository);

  Future<bool> isLoggedIn() async {
    var currentUser = await userRepository.currentUser();
    return currentUser != null;
  }

  @override
  void dispose() {}
}
