import 'package:firebase_auth/firebase_auth.dart';
import 'package:where_to_have_lunch/domain/models/user.dart';

class UserMapper {
  UserLocal fromFirebase(User firebaseUser) {
    return UserLocal(
      name: firebaseUser.displayName ?? "-",
      photoUrl: firebaseUser.photoURL,
    );
  }
}
