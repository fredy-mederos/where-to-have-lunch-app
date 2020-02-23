import 'package:rxdart/rxdart.dart';
import 'package:where_to_have_lunch/domain/models/user.dart';
import 'package:where_to_have_lunch/domain/repository/place_repository.dart';
import 'package:where_to_have_lunch/domain/repository/user_repository.dart';
import 'package:where_to_have_lunch/ui/base/bloc_base.dart';

class SettingsBloC implements BaseBloC {
  final UserRepository _userRepository;
  final PlaceRepository _placeRepository;

  SettingsBloC(this._userRepository, this._placeRepository);

  PublishSubject<User> _currentUserController = PublishSubject();

  Stream<User> get currentUserStream => _currentUserController.stream;

  void loadCurrentUser() async {
    try {
      User user = await _userRepository.currentUser();
      _currentUserController.sinkAddSafe(user);
    } catch (ex) {}
  }

  void logout() async {
    await _userRepository.logOut();
    await _placeRepository.logOut();
  }

  @override
  void dispose() {
    _currentUserController.close();
  }
}
