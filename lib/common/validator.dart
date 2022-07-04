import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_application_2/common/exceptions.dart';

int validateResponse({required Response response}) {
  if (response.statusCode != 200) {
    return 1;
  } else {
    return 0;
  }
}
