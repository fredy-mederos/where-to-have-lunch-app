import 'package:firebase_auth/firebase_auth.dart';
import 'package:where_to_have_lunch/domain/models/user.dart';

class UserMapper {
  User fromFirebase(FirebaseUser firebaseUser) {
    return User(
      name: firebaseUser.displayName,
      photoUrl: firebaseUser.photoUrl,
    );
  }
}
