import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:movies_db/utils/constants/backend_apis.dart';

class ApiManager {
  static final ApiManager _instance = ApiManager._internal();
  late Dio _dio;

  factory ApiManager() {
    return _instance;
  }

  ApiManager._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: BackendApis.baseUrl,
      connectTimeout: const Duration(seconds: 4),
      receiveTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 4),
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          var newToken = await _refreshToken();
          if (newToken != null) {
            e.requestOptions.headers["Authorization"] = "Bearer $newToken";
            return handler.resolve(await _dio.fetch(e.requestOptions));
          }
        }
        return handler.next(e);
      },
    ));

    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }

  Future<String?> _refreshToken() async {
    // Implement token refresh logic
    return null;
  }

  Future<T> getRequest<T>(String endpoint,

      {CancelToken? cancelToken,Map<String, dynamic>? queryParams}) async {
    Response response = await _dio.get(
        endpoint,cancelToken: cancelToken, queryParameters: queryParams);
    return response.data as T;
  }

  Future<T> postRequest<T>(String endpoint,
      {dynamic data, Map<String, dynamic>? queryParams}) async {
    try {
      Response response =
          await _dio.post(endpoint, data: data, queryParameters: queryParams);
      return response.data as T;
    } on DioException catch (e) {
      log("Dio Error: ${e.message}", error: e);
      throw _handleError(e);
    } catch (e) {
      log("Unexpected Error: $e");
      throw Exception("Unexpected error occurred");
    }
  }

  dynamic _handleError(DioException e) {
    if (e.response != null) {
      log("Server Error: ${e.response?.statusCode} - ${e.response?.data}");
      throw Exception("Server error: ${e.response?.statusCode}");
    } else {
      log("Network Error: ${e.message}");
      throw Exception("Network error: ${e.message}");
    }
  }
}
