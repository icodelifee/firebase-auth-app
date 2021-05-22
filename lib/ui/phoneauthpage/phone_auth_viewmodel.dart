import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/auth_locator.dart';
import 'package:fluttertest/data/providers/auth_repository_provider.dart';
import 'package:fluttertest/data/providers/firebase_auth_provider.dart';
import 'package:fluttertest/data/repository/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_context/one_context.dart';

final phoneAuthViewProvider = ChangeNotifierProvider.autoDispose((ref) =>
    PhoneAuthViewModel(
        ref.read(authRespositoryProvider), ref.read(firebaseAuthProvider)));

class PhoneAuthViewModel extends ChangeNotifier {
  PhoneAuthViewModel(this.repo, this.auth);
  final AuthRepository repo;
  final FirebaseAuth auth;
  String? status;
  String? actualCode;
  bool isOTP = false;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future getOTP(String phone) async {
    final PhoneCodeSent codeSent = (String vId, int? resendToken) async {
      actualCode = vId;
      print('Code sent to $phone');
      isOTP = true;
      isLoading = false;
      notifyListeners();
      await OneContext().showSnackBar(
        builder: (_) => SnackBar(
          content: Text('Enter the code sent to ' + phone),
        ),
      );
    };

    final codeAutoRetrievalTimeout = (String verificationId) {
      actualCode = verificationId;
      OneContext().showSnackBar(
        builder: (_) => SnackBar(
          content: Text('Auto retrieval time out'),
        ),
      );
    };

    final verificationFailed = (FirebaseAuthException authException) {
      status = '${authException.message}';

      print('Error message: ' + status!);
      if (authException.message!.contains('not authorized')) {
        status = 'Something has gone wrong, please try later';
      } else {
        if (authException.message!.contains('Network')) {
          status = 'Please check your internet connection and try again';
        }
      }
      isOTP = false;
      isLoading = false;
      notifyListeners();
      OneContext().showSnackBar(
        builder: (_) => SnackBar(
          content: Text(status!),
        ),
      );
    };

    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential auth) async {
      await FirebaseAuth.instance.signInWithCredential(auth);
      await OneContext().pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => AuthLocator()), (route) => false);
      await OneContext().showSnackBar(
        builder: (_) => SnackBar(
          content: Text(
            'Auto retrieving verification code',
          ),
        ),
      );
    };

    await auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  Future submitOTP(String smsCode, BuildContext context) async {
    final _authCredential = PhoneAuthProvider.credential(
        verificationId: actualCode!, smsCode: smsCode);

    await auth.signInWithCredential(_authCredential).then((value) {
      OneContext().pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => AuthLocator()), (route) => false);
    }).catchError((error) {
      OneContext().showSnackBar(
        builder: (_) => SnackBar(
          content: Text(
            'Something has gone wrong, please try later',
          ),
        ),
      );
    });
    isLoading = false;
    notifyListeners();
  }
}
