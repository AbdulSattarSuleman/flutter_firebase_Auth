import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Register User Via Email and password
  Future<User?> registerUserWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    // Try catch For Error Handling that Email Already Registered.
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.deepOrange,
          content: Text(e.message.toString())));
    } catch (e) {
      print(e);
    }
  }

  // Login User
  Future<User?> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(e.message.toString())));
    }
  }

  // Google SignIn Auth
  Future<User?> signInWithGoogle() async {
    try {
      // trigger the authentication dialog display google accounts
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        // Obtain the auth detail from the request
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Create A New credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Once the SignIn return the user data from the firebase
        UserCredential userCredential =
            await firebaseAuth.signInWithCredential(credential);
        return userCredential.user;
      }
    } catch (e) {
      Text(e.toString());
    }
  }

  // Google SIgn Out
  Future googleSignOut() async {
    await GoogleSignIn().signOut();
    await firebaseAuth.signOut();
  }
}
