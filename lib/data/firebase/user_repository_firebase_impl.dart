import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:where_to_have_lunch/domain/models/user.dart';
import 'package:where_to_have_lunch/domain/repository/user_repository.dart';
import 'package:where_to_have_lunch/utils/logger.dart';

class UserRepositoryFirebaseImpl implements UserRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _currentUser;

  final Logger logger;

  UserRepositoryFirebaseImpl(this.logger);

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
    logger.log("signed in " + user.displayName);

    _currentUser = User(name: user.displayName);
    return _currentUser;
  }

  @override
  Future<User> currentUser() async {
    try {
      var currentUser = await _auth.currentUser();
      logger.log(currentUser);
      return null;
    } catch (ex) {
      return null;
    }
  }

  @override
  Future logOut() async {
    await _auth.signOut();
  }
}
