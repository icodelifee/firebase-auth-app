import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertest/data/repository/auth_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.firebaseAuth,
  });
  final FirebaseAuth firebaseAuth;

  @override
  Future<UserCredential> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();

      final googleAuth = await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on PlatformException catch (e) {
      print(e.message);
      throw Exception('Some Error Occured During Auth');
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      throw FirebaseAuthException(
          message: 'Some Error Occured During SignIn!', code: e.code);
    }
  }
}
