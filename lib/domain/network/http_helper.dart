import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'api_exception.dart';

abstract class HttpHelper {

  final Dio _dio = Dio();

  Future<dynamic> getMethod(String endPoint) async {
    var responseJson;
    try {
      print("Endpoint : $endPoint");
      final response = await _dio.get(endPoint);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw NetworkException(message: "Koneksi gagal");
    }

    return responseJson;
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var result = response.data;
        return result;
        break;
      case 401:
        throw UnauthorizedException(errorBody: response.data);
        break;
      default:
        throw ErrorRequestException(errorBody: response.data, errorCode: response.statusCode);
        break;
    }
  }
}