import 'package:sworks_mobile/features/auth/domain/entities/login_result.dart';
import 'package:sworks_mobile/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum LoginStatusEnum {
  initial,
  loading,
  guest,
  siteManager,
  master,
  manager,
  systemManager,
  user,
  changePwd,
  error,
}

class LoginState {
  final LoginStatusEnum loginStatus;
  final String? errorMessage;
  final bool isPasswordVisible;

  const LoginState({
    required this.loginStatus,
    this.errorMessage,
    this.isPasswordVisible = false,
  });
  factory LoginState.initial() =>
      LoginState(loginStatus: LoginStatusEnum.initial);

  LoginState copyWith({
    LoginStatusEnum? status,
    String? errorMessage,
    bool? isPasswordVisible,
  }) {
    return LoginState(
      loginStatus: status ?? loginStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }

  @override
  String toString() {
    return 'LoginStatus(status: $loginStatus)';
  }
}

class LoginViewModel extends StateNotifier<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase) : super(LoginState.initial());

  /// 비밀번호 옵저버
  void togglePasswordVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  /// 로그인
  Future<void> login(String userId, String userPassword) async {
    // 1. 로딩 상태로 변경
    state = state.copyWith(status: LoginStatusEnum.loading);

    try {
      // 2. 필요한 토큰 및 정보 가져오기
      // final fcmToken = await SecureStorageUtil.getFcmToken();
      // if (fcmToken == null) {
      //   _handleError('FCM 토큰이 없습니다.');
      //   return;
      // }

      // 3. 로그인 API 호출 및 결과 처리
      final result = await _loginUseCase.login(
        userId,
        userPassword,
        'testToken',
      );

      // 4. 결과에 따른 상태 업데이트
      _handleLoginResult(result);
    } catch (e) {
      _handleError(e.toString());
    }
  }

  /// 로그인 결과 처리
  void _handleLoginResult(LoginResult result) {
    switch (result.type) {
      case LoginResultType.guest:
        // 관리자 로그인 성공
        if (result.accessToken != null &&
            result.refreshToken != null &&
            result.rule != null) {
          state = state.copyWith(status: LoginStatusEnum.guest);
        } else {
          _handleError('토큰 정보가 올바르지 않습니다');
        }
        break;
      case LoginResultType.siteManager:
        // 관리자 로그인 성공
        if (result.accessToken != null &&
            result.refreshToken != null &&
            result.rule != null) {
          state = state.copyWith(status: LoginStatusEnum.siteManager);
        } else {
          _handleError('토큰 정보가 올바르지 않습니다');
        }
        break;
      case LoginResultType.master:
        // 관리자 로그인 성공
        if (result.accessToken != null &&
            result.refreshToken != null &&
            result.rule != null) {
          state = state.copyWith(status: LoginStatusEnum.master);
        } else {
          _handleError('토큰 정보가 올바르지 않습니다');
        }
        break;
      case LoginResultType.systemManager:
        // 관리자 로그인 성공
        if (result.accessToken != null &&
            result.refreshToken != null &&
            result.rule != null) {
          state = state.copyWith(status: LoginStatusEnum.systemManager);
        } else {
          _handleError('토큰 정보가 올바르지 않습니다');
        }
        break;

      case LoginResultType.manager:
        // 관리자 로그인 성공
        if (result.accessToken != null &&
            result.refreshToken != null &&
            result.rule != null) {
          state = state.copyWith(status: LoginStatusEnum.manager);
        } else {
          _handleError('토큰 정보가 올바르지 않습니다');
        }
        break;

      case LoginResultType.user:
        // 일반 사용자 로그인 성공
        if (result.accessToken != null &&
            result.refreshToken != null &&
            result.rule != null) {
          state = state.copyWith(status: LoginStatusEnum.user);
        } else {
          _handleError('토큰 정보가 올바르지 않습니다');
        }
        break;

      case LoginResultType.changePassword:
        // 비밀번호 변경 필요
        state = state.copyWith(status: LoginStatusEnum.changePwd);
        break;

      case LoginResultType.error:
        // 로그인 실패
        state = state.copyWith(
          status: LoginStatusEnum.error,
          errorMessage: result.errorMessage ?? '알 수 없는 오류가 발생했습니다',
        );
        break;
    }
  }

  /// 오류 처리
  void _handleError(String errorMessage) {
    state = state.copyWith(
      status: LoginStatusEnum.error,
      errorMessage: errorMessage,
    );
  }
}
