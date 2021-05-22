import 'package:fluttertest/data/repository/api_repository.dart';
import 'package:fluttertest/data/repository/api_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final apiRepositoryProvider =
    Provider<APIRepository>((ref) => APIRepositoryImpl());
