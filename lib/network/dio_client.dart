import 'package:sworks_mobile/core/storage/secure_storage_util.dart';
import 'package:sworks_mobile/network/api_endpoint.dart';
import 'package:dio/dio.dart';
import 'dart:io' show Platform;

import 'package:logger/logger.dart';

/// DioClient
///
/// 공통으로 사용할 DioClient singleton 인스턴스를 반환하는 factory method를 포함합니다.
///
/// * [baseUrl] : ApiEndPoint.baseUrl
/// * [connectTimeout], [receiveTimeout] : 15초
/// * [headers] :
///   - 'Content-Type': 'application/json'
///   - "X-Device-OS": Platform.isIOS ? 'iOS' : 'AOS'
///
/// [onError] 인터셉터 :
/// 409 Conflict 응답 시 SecureStorageUtil.clearAll() 호출하여 토큰 삭제,
/// onLogout callback 호출
class DioClient {
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;

  late final Dio dio;

  // 기기 OS 정보 (한 번만 초기화)
  final String deviceOS = Platform.isIOS ? 'iOS' : 'AOS';

  // 로그아웃 콜백 (앱에서 DI 또는 setter로 주입 가능)
  static void Function()? onLogout;

  DioClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndPoint.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {'Content-Type': 'application/json', "X-Device-OS": deviceOS},
      ),
    );

    /// 토큰 추가 인터셉터
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await SecureStorageUtil.getAccessToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (e, handler) async {
          // 409 Conflict 처리: 토큰 만료시 자동 로그아웃 및 토큰 삭제
          if (e.response?.statusCode.toString().contains("409") == true) {
            if (onLogout != null) onLogout!();
          }
          handler.next(e);
        },
        onResponse: (response, handler) => handler.next(response),
      ),
    );
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    Logger().d(
      "dio Get : header : ${dio.options.headers}, path : $path, queryParameters : $queryParameters",
    );
    return await dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    Logger().d(
      "dio Post : header : ${dio.options.headers}, path : $path, data : $data , queryParameters : $queryParameters",
    );
    return await dio.post(path, data: data, queryParameters: queryParameters);
  }

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    Logger().d(
      "dio Put : header : ${dio.options.headers}, path : $path, data : $data , queryParameters : $queryParameters",
    );
    return await dio.put(path, data: data, queryParameters: queryParameters);
  }

  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    Logger().d(
      "dio Delete : header : ${dio.options.headers}, path : $path, data : $data , queryParameters : $queryParameters",
    );
    return await dio.delete(path, data: data, queryParameters: queryParameters);
  }
}
