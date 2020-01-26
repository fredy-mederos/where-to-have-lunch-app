import 'package:rxdart/rxdart.dart';
import 'package:where_to_have_lunch/domain/models/user.dart';
import 'package:where_to_have_lunch/domain/repository/user_repository.dart';
import 'package:where_to_have_lunch/ui/base/bloc_base.dart';

class SettingsBloC implements BaseBloC {
  final UserRepository _userRepository;

  SettingsBloC(this._userRepository) {
    _loadCurrentUser();
  }

  PublishSubject<User> _currentUserController = PublishSubject();

  Stream<User> get currentUserStream => _currentUserController.stream;

  void _loadCurrentUser() async {
    try {
      User user = await _userRepository.currentUser();
      _currentUserController.sinkAddSafe(user);
    } catch (ex) {}
  }

  void logout() async {
    await _userRepository.logOut();
  }

  @override
  void dispose() {
    _currentUserController.close();
  }
}
