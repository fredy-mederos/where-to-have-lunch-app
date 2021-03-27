
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepositoryImpl{
  FirebaseAuth? _auth;

  Future<FirebaseAuth> getAuth() async{
    if(_auth == null) {
      _auth = FirebaseAuth.instance;
    }
    return _auth!;
  }
}