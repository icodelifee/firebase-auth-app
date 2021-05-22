import 'package:dio/dio.dart';
import 'package:fluttertest/data/config/dioInstance.dart';
import 'package:fluttertest/data/config/exceptions.dart';
import 'package:fluttertest/data/config/handle_response.dart';
import 'package:fluttertest/data/models/restaurant.dart';
import 'package:fluttertest/data/repository/api_repository.dart';

class APIRepositoryImpl implements APIRepository {
  APIRepositoryImpl() : dio = dioInstance;

  late final dio;
  @override
  Future<Restaurant> getRestaurantMenus() async {
    try {
      final response = await dio.get('5dfccffc310000efc8d2c1ad');
      final json = handleResponse(response);
      final restaurant = restaurantFromJson(json);
      // return first element as its the only restaurant in the json
      return restaurant.first;
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        throw FetchDataException('No Internet connection');
      } else {
        throw FetchDataException(e.message);
      }
    }
  }
}
