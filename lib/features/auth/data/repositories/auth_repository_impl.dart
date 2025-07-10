import 'package:sworks_mobile/core/storage/secure_storage_util.dart';
import 'package:sworks_mobile/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:sworks_mobile/features/auth/data/models/login_response_model.dart';
import 'package:sworks_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:sworks_mobile/network/base_response.dart';
import 'package:sworks_mobile/routers.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/web.dart';

/// AuthRepository 구현체
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<BaseResponse<LoginResponseModel>> login(
    String userId,
    String userPassword,
    String fcmToken,
  ) async {
    // RemoteDataSource에서 로그인 요청 (에러 처리도 RemoteDataSource에서 진행)
    final response = await _remoteDataSource.login(
      userId,
      userPassword,
      fcmToken,
    );

    // 로그인 성공 시 SecureStorage에 정보 저장
    if (response.code == 100 || response.code == 200) {
      await SecureStorageUtil.saveLoginInfo(response.data);

      // 토큰 정보 저장 메서드 호출
      String rule = '';
      if (response.message.contains('rule:')) {
        rule = response.message.split('rule:')[1].trim();
      }

      await saveTokens(
        accessToken: response.data.accessToken,
        refreshToken: response.data.refreshToken,
        rule: rule,
      );
    }

    return response;
  }

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    required String rule,
  }) async {
    // SecureStorageUtil을 사용하여 토큰 정보 저장
    await SecureStorageUtil.saveAccessToken(accessToken);
    await SecureStorageUtil.saveRefreshToken(refreshToken);
    if (rule.isNotEmpty) {
      await SecureStorageUtil.saveRule(rule);
    }
  }

  // 토큰에 의한 로그아웃 특성상 앱 전역에서 사용해야하기 때문에 Repo에서 정의
  @override
  Future<void> logout() async {
    await SecureStorageUtil.clearAll();
    if (rootNavKey.currentContext != null) {
      rootNavKey.currentContext!.go('/login');
    } else {
      Logger().d("[AuthRepositoryImpl] logout: 네비게이션 컨텍스트 없음");
    }
  }
}
