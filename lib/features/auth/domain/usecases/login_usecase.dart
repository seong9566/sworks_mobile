import 'package:sworks_mobile/features/auth/data/models/login_response_model.dart';
import 'package:sworks_mobile/features/auth/domain/entities/login_result.dart';
import 'package:sworks_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:sworks_mobile/network/base_response.dart';
import 'dart:async';

/// 로그인 유스케이스
class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  /// 로그인 시도 및 결과 처리
  ///
  /// [userId] 사용자 아이디
  /// [userPassword] 사용자 비밀번호
  /// [fcmToken] Firebase 클라우드 메시징 토큰
  ///
  /// 반환값: [LoginResult] 로그인 결과 정보
  Future<LoginResult> login(
    String userId,
    String userPassword,
    String fcmToken,
  ) async {
    try {
      // 입력값 검증
      _validateLoginInputs(userId, userPassword);

      // 저장소를 통한 로그인 요청
      final response = await _repository.login(
        userId.trim(),
        userPassword.trim(),
        fcmToken,
      );

      // 로그인 응답 처리 및 결과 반환
      return _processLoginResponse(response);
    } on ArgumentError catch (e) {
      return LoginResult.error(errorMessage: e.message);
    } catch (e) {
      return LoginResult.error(errorMessage: '로그인 중 오류가 발생했습니다: $e');
    }
  }

  void _validateLoginInputs(String userId, String userPassword) {
    if (userId.trim().isEmpty) {
      throw ArgumentError('아이디를 입력해주세요.');
    }

    if (userPassword.trim().isEmpty) {
      throw ArgumentError('비밀번호를 입력해주세요.');
    }
  }

  LoginResult _processLoginResponse(BaseResponse<LoginResponseModel> response) {
    switch (response.code) {
      case 100:
        final rule = _extractRuleFromMessage(response.message);
        // 관리자 로그인 성공
        return LoginResult.success(
          type: LoginResultType.manager,
          accessToken: response.data.accessToken,
          refreshToken: response.data.refreshToken,
          rule: rule,
          code: response.code,
        );

      case 200:
        // 일반 사용자 로그인 성공
        final rule = _extractRuleFromMessage(response.message);
        return LoginResult.success(
          type: LoginResultType.user,
          accessToken: response.data.accessToken,
          refreshToken: response.data.refreshToken,
          rule: rule,
          code: response.code,
        );

      case 201:
        // 비밀번호 변경 필요
        return LoginResult.changePassword(code: response.code);
      case 400:
        return LoginResult.error(errorMessage: "아이디 또는 비밀번호를 확인해 주세요.");
      case 500:
        return LoginResult.error(errorMessage: "네트워크 연결을 확인해 주세요.");
      default:
        // 로그인 실패
        return LoginResult.error(
          errorMessage: "로그인 중 오류가 발생했습니다.",
          code: response.code,
        );
    }
  }

  /// 메시지에서 권한 정보 추출
  String _extractRuleFromMessage(String message) {
    if (message.contains('rule:')) {
      return message.split('rule:')[1].trim();
    }

    final RegExp regExp = RegExp(r'\(([^)]+)\)');
    final match = regExp.firstMatch(message);
    return match?.group(1) ?? '';
  }
}
