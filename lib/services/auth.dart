import 'package:brew_crew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create a user object
  User _createUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_createUser);
  }

  // sign in anonymously
  Future signInAnonymously() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      return _createUser(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email & password
  // register with email & password
  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
