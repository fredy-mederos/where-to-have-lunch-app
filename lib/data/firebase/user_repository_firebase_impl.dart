import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:where_to_have_lunch/data/firebase/auth_repository_impl.dart';
import 'package:where_to_have_lunch/data/firebase/user_mapper.dart';
import 'package:where_to_have_lunch/domain/models/user.dart';
import 'package:where_to_have_lunch/domain/repository/user_repository.dart';
import 'package:where_to_have_lunch/utils/logger.dart';

class UserRepositoryFirebaseImpl extends FirebaseAuthRepositoryImpl implements UserRepository {
  final Logger logger;
  final UserMapper mapper;

  UserRepositoryFirebaseImpl(this.logger, this.mapper);

  @override
  Future<UserLocal> login() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    if(googleAuth==null)
      throw Exception("User invalid");

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final User? user = (await (await getAuth()).signInWithCredential(credential)).user;

    return mapper.fromFirebase(user!);
  }

  @override
  Future<UserLocal?> currentUser() async {
    try {
      return mapper.fromFirebase((await getAuth()).currentUser!);
    } catch (ex) {
      return null;
    }
  }

  @override
  Future logOut() async {
    await (await getAuth()).signOut();
  }


}
