import 'dart:async';


import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../utils/env.dart';
import 'api_client.dart';

class DioClient extends ApiClient {
  String? _accessToken;

  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 30),
      followRedirects: false,
      baseUrl: Env.apiBaseUrl,
      responseType: ResponseType.plain,
      contentType: "application/json",
      headers: {'Content-Type': 'application/json', 'Authorization': ''},
    ),
  );

  DioClient() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // _accessToken = await Settings.getAccessToken();
          // if (_accessToken != null) {
          //   options.headers['Authorization'] = 'Bearer $_accessToken';
          // }
          return handler.next(options);
        },
        onError: (error, handler) async {
          if (error.type == DioExceptionType.receiveTimeout ||
              error.type == DioExceptionType.connectionTimeout) {
            return;
          }
          if (error.response?.statusCode == 401 && error.response?.data == "") {
            return;
          }
          handler.next(error);
        },
      ),
    );

    _dio.interceptors.add(
      AwesomeDioInterceptor(
        logRequestTimeout: false,
        logRequestHeaders: true,
        logResponseHeaders: true,
        logger: debugPrint,
      ),
    );
  }

  @override
  Future<ApiResponse> get(
    String path, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? header,
  }) async {
    try {
      var res = await _dio.get(
        path,
        queryParameters: query,
        options: Options(headers: {..._dio.options.headers, ...header ?? {}}),
      );
      var response = ApiResponse(status: Status.success);
      response.body = res.data;
      response.code = res.statusCode;
      response.message = res.statusMessage;
      return response;
    } catch (e) {
      return processException(e);
    }
  }

  @override
  Future<ApiResponse> post(
    String path, {
    Object? data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? header,
  }) async {
    try {
      var res = await _dio.post(
        path,
        data: data,
        queryParameters: query,
        options: Options(headers: {..._dio.options.headers, ...header ?? {}}),
      );
      var response = ApiResponse(status: Status.success);
      response.body = res.data;
      response.code = res.statusCode;
      response.message = res.statusMessage;
      return response;
    } catch (e) {
      return processException(e);
    }
  }

  @override
  Future<ApiResponse> put(
    String path, {
    Object? data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? header,
  }) async {
    try {
      var res = await _dio.put(
        path,
        data: data,
        queryParameters: query,
        options: Options(headers: {..._dio.options.headers, ...header ?? {}}),
      );
      var response = ApiResponse(status: Status.success);
      response.body = res.data;
      response.code = res.statusCode;
      response.message = res.statusMessage;
      return response;
    } catch (e) {
      return processException(e);
    }
  }

  @override
  Future<ApiResponse> delete(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? header,
  }) async {
    try {
      var res = await _dio.delete(
        path,
        data: data,
        queryParameters: query,
        options: Options(headers: {..._dio.options.headers, ...header ?? {}}),
      );
      var response = ApiResponse(status: Status.success);
      response.body = res.data;
      response.code = res.statusCode;
      response.message = res.statusMessage;
      return response;
    } catch (e) {
      return processException(e);
    }
  }

  ApiResponse processException(e) {
    if (e is DioException) {
      var response = ApiResponse(status: Status.httpClientException);
      response.body = e.response?.data;
      response.code = e.response?.statusCode;
      response.message = e.response?.statusMessage;
      return response;
    } else if (e is Exception) {
      var response = ApiResponse(status: Status.exception);
      response.message = e.toString();
      return response;
    } else {
      var response = ApiResponse(status: Status.unknownError);
      return response;
    }
  }
}
