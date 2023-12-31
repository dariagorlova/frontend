import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:frontend/core/error/exception.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// internet API class
/*class HTTPManager {
  HTTPManager._private() {
    const server = 'http://localhost:8080/api/';
    final baseOptions = BaseOptions(
      baseUrl: server,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      contentType: Headers.jsonContentType,
    );
    dio = Dio(baseOptions);
    dio.interceptors.add(
      PrettyDioLogger(
        responseBody: false,
        maxWidth: 100,
      ),
    );

    //dio.httpClientAdapter = HttpClientAdapter();
  }

  static final instance = HTTPManager._private();

  late Dio dio;

  Future<dynamic> get({
    required String url,
    Map<String, dynamic>? params,
    String? token,
  }) async {
    try {
      final options = Options(
          followRedirects: false,
          validateStatus: (status) => (status ?? 0) < 500,
          headers: {'token': token ?? '', 'contentType': 'application/json'});
      final response = await dio.get<Object>(
        url,
        data: params,
        options: options,
      );
      if (response.statusCode == 226) {
        throw const StatusCodeException(226);
      }
      if (response.statusCode == 426) {
        throw const StatusCodeException(426);
      }

      final result = response.data as Map<String, dynamic>;
      if (result['status'] == 'success') {
        return result;
      } else {
        throw ServerException(result['message']);
      }
    } on DioException catch (error, _) {
      throw const ServerException('something went wrong');
    }
  }

  Future<dynamic> post({
    required String url,
    Map<String, dynamic>? params,
    String? token,
  }) async {
    try {
      final options = Options(
          followRedirects: false,
          validateStatus: (status) => (status ?? 0) < 500,
          headers: {
            'token': token ?? '',
            'contentType': 'application/json',
          });
      final response = await dio.post<Object>(
        url,
        data: params,
        options: options,
      );
      if (response.statusCode == 226) {
        throw const StatusCodeException(226);
      }
      if (response.statusCode == 426) {
        throw const StatusCodeException(426);
      }
      final result = response.data as Map<String, dynamic>;
      if (result['status'] == 'success') {
        return result;
      } else {
        throw ServerException(result['message']);
      }
    } on DioException catch (error, _) {
      throw const ServerException('something went wrong');
    }
  }
}
*/

/// internet API class
class HTTPManager {
  HTTPManager._private() {
    const server = 'http://localhost:8080/api/';
    final baseOptions = BaseOptions(
      // ignore: avoid_redundant_argument_values
      baseUrl: server,
      connectTimeout: 90000,
      receiveTimeout: 90000,
      contentType: Headers.jsonContentType,
    );
    dio = Dio(baseOptions);
    dio.interceptors.add(
      PrettyDioLogger(
        responseBody: false,
        maxWidth: 100,
      ),
    );

    if (!kIsWeb) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }
  }

  static final instance = HTTPManager._private();

  late Dio dio;

  Future<dynamic> get({
    required String url,
    String? token,
  }) async {
    try {
      final options = Options(
          followRedirects: false,
          validateStatus: (status) => (status ?? 0) < 500,
          headers: {'token': token ?? '', 'contentType': 'application/json'});
      final response = await dio.get<Object>(
        url,
        options: options,
      );
      if (response.statusCode == 226) {
        throw const StatusCodeException(226);
      }
      if (response.statusCode == 426) {
        throw const StatusCodeException(426);
      }

      final result = response.data as Map<String, dynamic>;
      if (result['status'] == 'success') {
        return result;
      } else {
        throw ServerException(result['message']);
      }
    } on DioError catch (error, _) {
      throw const ServerException('something went wrong');
    }
  }

  Future<dynamic> post({
    required String url,
    Map<String, dynamic>? params,
    String? token,
  }) async {
    try {
      final options = Options(
          followRedirects: false,
          validateStatus: (status) => (status ?? 0) < 500,
          headers: {
            'token': token ?? '',
            'contentType': 'application/json',
          });
      final response = await dio.post<Object>(
        url,
        data: params,
        options: options,
      );
      if (response.statusCode == 226) {
        throw const StatusCodeException(226);
      }
      if (response.statusCode == 426) {
        throw const StatusCodeException(426);
      }
      final result = response.data as Map<String, dynamic>;
      if (result['status'] == 'success') {
        return result;
      } else {
        throw ServerException(result['message']);
      }
    } on DioError catch (error, _) {
      throw const ServerException('something went wrong');
    }
  }
}
