import 'package:fluttertest/data/providers/firebase_auth_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authListenerProvider =
    StreamProvider((ref) => ref.read(firebaseAuthProvider).authStateChanges());
