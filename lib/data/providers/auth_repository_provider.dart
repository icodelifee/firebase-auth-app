import 'package:fluttertest/data/providers/firebase_auth_provider.dart';
import 'package:fluttertest/data/repository/auth_repository.dart';
import 'package:fluttertest/data/repository/auth_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authRespositoryProvider = Provider<AuthRepository>(
    (ref) => AuthRepositoryImpl(firebaseAuth: ref.read(firebaseAuthProvider)));
