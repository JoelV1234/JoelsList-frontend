import 'package:dio/dio.dart';
import 'package:joelslist/config/backend_config.dart';
import 'package:joelslist/services/http_service/http_implementaion.dart';

class HttpClient implements HttpImplementation{


  var options = BaseOptions(
    baseUrl: baseUrl,

  );

  Dio get dio => Dio(options);

  @override
  Future<Response> get({
    Map<String, dynamic>? queryParams, 
    required String path
  }) {
    return dio.get(
      path, 
      queryParameters: queryParams
    );
  }

  @override
  Future<Response> post({
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? data, 
    required String path
  }) {
    return dio.post(
      path, 
      queryParameters: queryParams,
      data : data
    );
  }
  
}