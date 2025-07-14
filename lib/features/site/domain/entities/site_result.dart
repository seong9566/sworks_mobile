import 'package:sworks_mobile/features/site/domain/entities/site_entity.dart';

/// 비즈니스 작업 결과 타입 정의
enum SiteResultType { success, failure }

class SiteResult {
  final SiteResultType type;
  final List<SiteEntity>? locations;
  final bool? hasPermission;
  final String? message;
  final int? code;

  /// 성공 결과 생성자
  const SiteResult.success({
    this.locations,
    this.hasPermission,
    this.code,
    this.message,
  }) : type = SiteResultType.success;

  /// 실패 결과 생성자
  const SiteResult.failure({this.message, this.code})
    : type = SiteResultType.failure,
      locations = null,
      hasPermission = null;

  /// 오류 결과 생성자 (이전 버전과의 호환성 유지)
  @Deprecated('Use failure instead')
  const SiteResult.error({String? errorMessage, this.code})
    : type = SiteResultType.failure,
      message = errorMessage,
      locations = null,
      hasPermission = null;
}
