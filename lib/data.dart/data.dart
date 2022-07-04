import 'package:dio/dio.dart';
import 'package:my_application_2/const/const.dart';

class HttpClient {
  static Dio dio = Dio(BaseOptions(baseUrl: baseUrl));
}
