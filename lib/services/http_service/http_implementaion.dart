import 'package:dio/dio.dart';

abstract class HttpImplementation {
  Future<Response> get({
    Map<String, dynamic>? queryParams, 
    required String path
  });

  Future<Response> post({
    Map<String, dynamic>? queryParams, 
    Map<String, dynamic>? data,
    required String path
  });
}



