import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // Register user ,
  Future<User?> register(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message.toString()),
        backgroundColor: Colors.red,
      ));
    } catch (e) {
      print(e);
    }
  }

//Login
  Future<User?> Login(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message.toString()),
        backgroundColor: Colors.red,
      ));
    } catch (e) {
      print(e);
    }
  }

//Google sign in,
  // Future<User?> signInWithGoogle() async {
  //   try {
  //     //This code shows to select the account,
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     if (googleUser != null) {
  //       //Obtain the auth details  from the request,
  //       final GoogleSignInAuthentication googleAuth =
  //           await googleUser.authentication;
  //       //create new credential,
  //       final credential = GoogleAuthProvider.credential(
  //           accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
  //       //once signed in return the user data from firebase,
  //       UserCredential userCredential =
  //           await firebaseAuth.signInWithCredential(credential);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
