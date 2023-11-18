import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class Rest {

  final Dio _dio = Dio();
  
  // perform a post request
  Future<dynamic> post(String data, String endpoint, String? token) async {

    //! temporary fix for apy calls
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient dioClient) {
      dioClient.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };

    Response response = await _dio.post(
      endpoint,
      data: data,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        contentType: "application/json",
        headers: {
          "Accept": "application/json",
          "Authorization": token == null ? "" : "Bearer $token"
        },
      ),
    );
    return response.data;
  }

  // perform a get request
  Future<dynamic> get(String data, String endpoint, String? token) async {

    //! temporary fix for apy calls
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient dioClient) {
      dioClient.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };

    Response response = await Dio().get(
      endpoint,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        contentType: "application/json",
        headers: {
          "Accept": "application/json",
          "Authorization": token!.isNotEmpty ? "Bearer $token" : ""
        },
      ),
    );

    return response.data;
  }

  // perform a delete request
  Future<dynamic> delete(String data, String endpoint, String? token) async {

    //! temporary fix for apy calls
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient dioClient) {
      dioClient.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };

    Response response = await Dio().delete(
      endpoint,
      data: data,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        contentType: "application/json",
        headers: {
          "Accept": "application/json",
          "Authorization": token == null ? "" : "Bearer $token"
        },
      ),
    );

    return response.data;

  }
}