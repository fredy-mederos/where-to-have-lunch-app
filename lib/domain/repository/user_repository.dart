import 'package:where_to_have_lunch/domain/models/user.dart';

abstract class UserRepository {
  Future<UserLocal> login();

  Future<UserLocal?> currentUser();

  Future logOut();
}
