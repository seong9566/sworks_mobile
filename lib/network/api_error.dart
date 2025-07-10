import 'package:sworks_mobile/network/base_response.dart';
import 'package:dio/dio.dart';
import 'dart:io';

class ApiError {
  /// DioException 처리를 위한 공통 메서드
  static BaseResponse<T> handleDioException<T>(
    DioException e,
    T Function(Map<String, dynamic>) fromJson,
    T defaultValue,
  ) {
    try {
      // HTTP 상태 코드 가져오기
      final statusCode = e.response?.statusCode;
      String errorMessage = '';

      // 서버 응답에서 에러 정보 가져오기
      if (e.response != null && e.response!.data != null) {
        try {
          final errorData = e.response!.data;

          // 서버 응답이 Map 형태인 경우
          if (errorData is Map<String, dynamic>) {
            // 서버에서 제공하는 에러 정보 그대로 사용
            if (statusCode == 400) {
              errorMessage = 'Bad Request';

              // title이 있는 경우 추가
              if (errorData.containsKey('title')) {
                errorMessage = errorData['title'] as String? ?? errorMessage;
              }

              // detail이 있는 경우 추가
              if (errorData.containsKey('detail')) {
                final detail = errorData['detail'] as String?;
                if (detail != null && detail.isNotEmpty) {
                  errorMessage = detail;
                }
              }

              // 서버 응답 전체를 문자열로 보여주기
              errorMessage = '$errorMessage - ${errorData.toString()}';
            } else {
              // 기타 상태 코드의 경우 서버 응답 그대로 사용
              errorMessage = errorData.toString();
            }
          } else if (errorData is String) {
            // 서버 응답이 문자열인 경우
            errorMessage = errorData;
          } else {
            // 기타 형태의 응답인 경우
            errorMessage = errorData.toString();
          }

          return BaseResponse<T>(
            code: statusCode ?? 500,
            message: errorMessage,
            data: defaultValue,
          );
        } catch (parseError) {
          // 서버 응답 파싱 실패 시 원본 응답 그대로 사용
          return BaseResponse<T>(
            code: statusCode ?? 500,
            message: e.response!.data.toString(),
            data: defaultValue,
          );
        }
      } else {
        // 서버 응답이 없는 경우 네트워크 오류 처리
        if (e.type == DioExceptionType.connectionTimeout) {
          errorMessage = '연결 시간 초과';
        } else if (e.type == DioExceptionType.receiveTimeout) {
          errorMessage = '응답 시간 초과';
        } else if (e.type == DioExceptionType.sendTimeout) {
          errorMessage = '요청 시간 초과';
        } else if (e.error is SocketException) {
          errorMessage = '네트워크 연결 실패';
        } else {
          errorMessage = '네트워크 오류: ${e.message}';
        }

        return BaseResponse<T>(
          code: statusCode ?? 500,
          message: errorMessage,
          data: defaultValue,
        );
      }
    } catch (parseError) {
      // 예외 처리 중 발생한 예외 처리
      return BaseResponse<T>(
        code: e.response?.statusCode ?? 500,
        message: e.toString(), // 원본 오류 메시지 그대로 사용
        data: defaultValue,
      );
    }
  }

  /// 일반 예외 처리를 위한 공통 메서드
  static BaseResponse<T> handleGeneralException<T>(Object e, T defaultValue) {
    return BaseResponse<T>(
      code: 500,
      message: '예상치 못한 오류 발생: $e',
      data: defaultValue,
    );
  }
}
