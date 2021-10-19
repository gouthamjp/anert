import 'package:anert/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<CustomUser?> get userDet {
    return _auth.authStateChanges().map((User? user) => _userfromfb(user!));
  }

  //user object
  CustomUser? _userfromfb(User user) {
    return user != null ? CustomUser(uid: user.email!) : null;
  }

  //signin

  Future signInEmailAndPass(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      return _userfromfb(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //firebase login
  Future signInAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User user = userCredential.user!;
      return _userfromfb(user);
    } catch (e) {
      return null;
    }
  }

  //sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
