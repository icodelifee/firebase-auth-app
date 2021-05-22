import 'package:dio/dio.dart';
import 'package:fluttertest/constants.dart';

Dio get dioInstance {
  final dio = Dio();
  dio.options.baseUrl = Constants.apiUrl;
  return dio;
}
