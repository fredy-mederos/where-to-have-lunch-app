import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:where_to_have_lunch/data/firebase/user_mapper.dart';
import 'package:where_to_have_lunch/domain/models/user.dart';
import 'package:where_to_have_lunch/domain/repository/user_repository.dart';
import 'package:where_to_have_lunch/utils/logger.dart';

class UserRepositoryFirebaseImpl implements UserRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final Logger logger;
  final UserMapper mapper;

  UserRepositoryFirebaseImpl(this.logger, this.mapper);

  @override
  Future<User> login() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;

    return mapper.fromFirebase(user);
  }

  @override
  Future<User> currentUser() async {
    try {
      var currentUser = await _auth.currentUser();
      return mapper.fromFirebase(currentUser);
    } catch (ex) {
      return null;
    }
  }

  @override
  Future logOut() async {
    await _auth.signOut();
  }
}
