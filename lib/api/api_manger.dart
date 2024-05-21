import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islamiy_app/UI/radio/model/RadioResponse.dart';
import 'package:islamiy_app/constants.dart';

class ApiManger {
  static late Dio dio;
  static Dio quranDio = Dio();
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseRadioApiUrl,
      ),
    );
  }

  static Future<Response> getRequest(
      {required String endPoints,
      Map<String, dynamic>? queryParameters}) async {
    var response = await dio.get(
      endPoints,
      queryParameters: queryParameters,
    );

    return response;
  }

  static Future<Either<RadioResponse, String>> getRadioResponse(
      {required String language}) async {
    try {
      var resopnse = await getRequest(
          endPoints: '/api/v3/radios', queryParameters: {"language": language});
      RadioResponse result = RadioResponse.fromJson(resopnse.data);
      log(result.radios?[0].name ?? "");
      return Left(result);
    } catch (error) {
      log(error.toString());
      return Right(error.toString());
    }
  }

  getQuranSound({required String path}) async {
    try {
      var response = await quranDio.get(path);
      return response;
    } catch (e) {
      log(e.toString());
    }
  }
}
