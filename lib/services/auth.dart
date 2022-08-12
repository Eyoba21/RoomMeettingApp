import 'package:firebase/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier {  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Users? _UserFromFirebaseUser(User? user) {
    return user != null ? Users(uid: user.uid) : null;
  }

//setting up Stream
  Stream<Users?> get user {
    return _auth.authStateChanges().map(_UserFromFirebaseUser);
  }
  Future getCurrentUid() async {
    return await _auth.currentUser!.uid;
  }
  Future getCurrentEmail() async {
    return await _auth.currentUser!.email;
  }

  Future SigninWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
              notifyListeners();
      User? user = result.user;
      return _UserFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
              notifyListeners();
      User? user = result.user;
      return _UserFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future SignInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _UserFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future SignOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  
}
