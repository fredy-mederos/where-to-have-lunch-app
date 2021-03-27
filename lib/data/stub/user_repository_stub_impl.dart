import 'package:where_to_have_lunch/domain/models/user.dart';
import 'package:where_to_have_lunch/domain/repository/user_repository.dart';

@Deprecated("Do not use this in production")
class UserRepositoryStubImpl implements UserRepository {
  UserLocal? _currentUser;

  @override
  Future<UserLocal> currentUser() async {
    return _currentUser!;
  }

  @override
  Future<UserLocal> login() {
    return Future.delayed(Duration(seconds: 2), () {
      //throw "Login Error";
      _currentUser = UserLocal(name: "UserName");
      return _currentUser!;
    });
  }

  @override
  Future logOut() async {
    _currentUser = null;
    print("Log out");
  }
}
