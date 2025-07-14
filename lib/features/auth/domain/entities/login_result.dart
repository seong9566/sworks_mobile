/// 로그인 결과 타입 정의
///   systemManager, 100 
  // master, - 101
  // manager, - 102
  //  일반 사용자 로그인 성공 (코드 200)
  // siteManager, -200
  // user, -201
  // guest, -202
enum LoginResultType {

  // 100
  systemManager, 
  // 101
  master, 
  //102
  manager, 

  // 200
  siteManager,
  // 201
  user,
  // 202
  guest,

  /// 비밀번호 변경 필요 (코드 199)
  changePassword,

  /// 로그인 실패 (기타 코드)
  error,
}

/// 로그인 결과 클래스
class LoginResult {
  final LoginResultType type;
  final String? accessToken;
  final String? refreshToken;
  final String? rule;
  final String? errorMessage;
  final int? code;

  LoginResult.success({
    required this.type,
    required this.accessToken,
    required this.refreshToken,
    required this.rule,
    this.code,
  }) : errorMessage = null;

  LoginResult.changePassword({required this.code})
    : type = LoginResultType.changePassword,
      accessToken = null,
      refreshToken = null,
      rule = null,
      errorMessage = null;

  LoginResult.error({required this.errorMessage, this.code})
    : type = LoginResultType.error,
      accessToken = null,
      refreshToken = null,
      rule = null;
}
