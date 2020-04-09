import 'package:where_to_have_lunch/domain/models/user.dart';
import 'package:where_to_have_lunch/domain/repository/user_repository.dart';

class UserRepositoryDemoImpl implements UserRepository {
  User _currentUser;

  @override
  Future<User> currentUser() async {
    return _currentUser;
  }

  @override
  Future<User> login() async {
    _currentUser = User(
      name: "Demo User",
      photoUrl: "https://cdn.pixabay.com/photo/2016/03/31/19/56/avatar-1295389_1280.png",
    );
    return _currentUser;
  }

  @override
  Future logOut() async {
    _currentUser = null;
  }
}
