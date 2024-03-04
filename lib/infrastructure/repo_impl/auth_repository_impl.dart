import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseApi {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<bool?> registerUserWithEmailPassword(String email, String password) async{
    bool? res;
    await auth.createUserWithEmailAndPassword(email: email, password: password)
    .then((value) async {
      res = true;
      debugPrint("Success SignUp");
    }).onError((error, stackTrace) {
      debugPrint("Error While SignUp $error");
      res = false;

    });
    return res;
  }

  Future<bool?> isLogin() async {
    bool? res;
    res = auth.currentUser != null;
    return res;
  }

  Future getEmail() async {
    return auth.currentUser!.email ?? "";
  }

  Future<bool?> logOut() async {
    bool? res;
    await auth.signOut().then((value) {
      debugPrint("Logout Success");
      res = true;
    }).onError((error, stackTrace) {
      res = false;
    });
    return res;
  }


//Methos to forgot password
  Future<bool?> forgetPassword(String email) async {
    bool? res;
    await auth.sendPasswordResetEmail(email: email).then((value) {
      res = true;
    }).onError((error, stackTrace) {});
    return res;
  }

//Methos to login using email password
  Future<bool?> loginUsingEmailAndPassword(String email, String password) async {
    bool? res;
    debugPrint("Email :$email \n Password: $password");
    await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {
      debugPrint("Response is $value");
      res = true;
    }).onError((error, stackTrace) {
      res = false;
      debugPrint("Error is $error");
    });
    return res;
  }

}
