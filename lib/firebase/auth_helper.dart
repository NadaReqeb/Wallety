import 'package:firebase_auth/firebase_auth.dart';


  class AuthHelper {
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<String?> createNewAccount(String email, String password) async {
  try {
  String enterdEmail = email;
  String enteredPassword = password;
  UserCredential userCredential =
  await firebaseAuth.createUserWithEmailAndPassword(
  email: enterdEmail, password: enteredPassword);
  return userCredential.user!.uid;
  } catch (e) {
  }
  }

  Future<UserCredential> signIn(String email, String password) async {
  UserCredential userCredential = await firebaseAuth
      .signInWithEmailAndPassword(email: email, password: password);
  return userCredential;
  }

  logout() async {
  await firebaseAuth.signOut();
  }

  forgetPassword(String email) async {
  firebaseAuth.sendPasswordResetEmail(email: email);
  }

  verifyEmail() async {
  firebaseAuth.currentUser!.sendEmailVerification();
  }


}