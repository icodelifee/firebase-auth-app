import 'package:dio/dio.dart';
import 'package:fluttertest/data/config/exceptions.dart';

dynamic handleResponse(Response response) {
  switch (response.statusCode) {
    case 200:
      return response.data;
    case 400:
      throw BadRequestException(response.data.toString());
    case 401:

    case 403:
      throw UnauthorisedException(response.data.toString());
    case 500:

    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
