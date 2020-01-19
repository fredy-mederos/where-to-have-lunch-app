import 'package:where_to_have_lunch/domain/models/user.dart';

abstract class UserRepository {
  Future login();

  Future<User> currentUser();
}
