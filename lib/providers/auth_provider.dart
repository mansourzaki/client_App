import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

import '../helpers/auth_helper.dart';
import '../helpers/firestore_helper.dart';

class AuthProvider with ChangeNotifier {
  final loginFormKey = GlobalKey<FormState>();
  final signUpFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  User? user;
  validateNull(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field shouldn\'t be done';
    }
  }

  emailValiation(String? value) {
    if (!isEmail(value!)) {
      return 'Wrong email';
    }
  }

  logIn(String emailAddress, String password) async {
    user = await AuthHelper.authHelper.signIn(emailAddress, password);
    notifyListeners();
  }

  signOut() async {
    user = AuthHelper.authHelper.signOut();
    notifyListeners();
  }

  getUserState() {
    user = AuthHelper.authHelper.getUserState();
    notifyListeners();
  }

  checkUser() async {
    user = await AuthHelper.authHelper.checkUser();
    notifyListeners();
  }

  signUp(String emailAddress, String password, String userName) async {
    UserCredential? user =
        await AuthHelper.authHelper.signUp(emailAddress, password);

    print(user);
    if (user != null) {
      print('in != null');
      await FirestoreHelper.firestoreHelper
          .addNewUserToFirestore(userName, emailAddress, user.user!.uid);
    }
  }
}
