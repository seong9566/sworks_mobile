import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_provider.freezed.dart';

/// 인증 상태를 관리하는 모델
@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isLoggedIn,
    @Default(false) bool isSystemManager,
    String? userId,
    String? userName,
    String? userRole,
  }) = _AuthState;
}

/// 인증 상태를 관리하는 StateNotifier
class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier() : super(const AuthState());

  /// 로그인 처리
  Future<void> login({
    required String userId,
    required String password,
  }) async {
    // TODO: 실제 로그인 API 호출 로직 구현
    
    // 임시 로직: 시스템 관리자 계정 확인 (실제로는 API 응답에서 역할 확인)
    final isSystemManager = userId == 'admin';
    
    // 로그인 성공 시 상태 업데이트
    state = state.copyWith(
      isLoggedIn: true,
      isSystemManager: isSystemManager,
      userId: userId,
      userName: '사용자 $userId', // 실제로는 API 응답에서 사용자명 가져옴
      userRole: isSystemManager ? 'SYSTEM_MANAGER' : 'USER',
    );
  }

  /// 로그아웃 처리
  void logout() {
    state = const AuthState();
  }
}

/// 인증 상태 Provider
final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  return AuthStateNotifier();
});
