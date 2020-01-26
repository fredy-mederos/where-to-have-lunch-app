import 'package:where_to_have_lunch/domain/models/user.dart';
import 'package:where_to_have_lunch/domain/repository/user_repository.dart';

class UserRepositoryStubImpl implements UserRepository {
  User _currentUser;

  @override
  Future<User> currentUser() async {
    return _currentUser;
  }

  @override
  Future<User> login() {
    return Future.delayed(Duration(seconds: 2), () {
      _currentUser = User(name: "UserName");
      return _currentUser;
    });
  }

  @override
  Future logOut() async {
    _currentUser = null;
  }
}
