import 'package:rxdart/rxdart.dart';
import 'package:where_to_have_lunch/domain/models/user.dart';
import 'package:where_to_have_lunch/domain/repository/configs_repository.dart';
import 'package:where_to_have_lunch/domain/repository/place_repository.dart';
import 'package:where_to_have_lunch/domain/repository/user_repository.dart';
import 'package:where_to_have_lunch/ui/base/viewmodel/base_viewmodel.dart';

class SettingsViewModel implements BaseViewModel {
  final UserRepository _userRepository;
  final PlaceRepository _placeRepository;
  final ConfigsRepository _configsRepository;

  SettingsViewModel(this._userRepository, this._placeRepository, this._configsRepository);

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
    await _configsRepository.logOut();
  }

  @override
  void dispose() {
    _currentUserController.close();
  }
}
