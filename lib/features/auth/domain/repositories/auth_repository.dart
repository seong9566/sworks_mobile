import 'package:sworks_mobile/features/auth/data/models/login_response_model.dart';
import 'package:sworks_mobile/network/base_response.dart';

/// 인증 관련 Repository 인터페이스
abstract class AuthRepository {
  /// 로그인 요청 및 처리
  Future<BaseResponse<LoginResponseModel>> login(
    String userId,
    String userPassword,
    String fcmToken,
  );

  /// 토큰 정보 저장
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    required String rule,
  });

  Future<void> logout();
}
