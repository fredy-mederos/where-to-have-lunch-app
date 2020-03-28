import 'package:where_to_have_lunch/domain/models/user.dart';

abstract class UserRepository {
  Future<User> login();

  Future<User> currentUser();

  Future logOut();
}
