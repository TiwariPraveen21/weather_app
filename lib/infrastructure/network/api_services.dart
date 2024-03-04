import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/infrastructure/network/api_exception.dart';

class ApiService {
  Future call(String url, { Object? data,Map<String, dynamic>? queryParameters,Options? options}) async {
    dynamic responsejson;
    try {
      var dio = Dio();
      // dio.interceptors.add(
      // PrettyDioLogger(requestBody: true, requestHeader: true, responseHeader: true)
      // );
      Response json = await dio.request(url,
        data: data,
        queryParameters: queryParameters,
        options: options
      );
      responsejson = returnRasponse(json);
      debugPrint(responsejson.hashCode.toString());
      return responsejson;
    } 
    on DioException catch (err) {
      if (err.type == DioExceptionType.connectionError ||
          err.type == DioExceptionType.connectionTimeout) {
        throw "Make sure you have opened your Wi-Fi or data connection and try again";
      }
      //return UserDataModel.fromJson(err.response?.data);
    } 
    catch (err) {
      rethrow;
    }
  }


 dynamic returnRasponse(Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responsejson = response;
        return responsejson;
      case 400:
        throw BadRequestException(response.statusMessage.toString());
      case 404:
        throw UnauthorisedException(response.statusMessage.toString());
      case 500:
      default:
        throw FetchDataException(
            "Error ocoured While Communicating with server with status code${response.statusCode}");
    }
  }
  
}





