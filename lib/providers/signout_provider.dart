import 'package:firebase_auth/firebase_auth.dart';

class AuthClass {
  FirebaseAuth auth = FirebaseAuth.instance;

  //SignOut
  void signOut() {
    auth.signOut();
  }
}
