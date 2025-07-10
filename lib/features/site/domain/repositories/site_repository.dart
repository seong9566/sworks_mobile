import 'package:sworks_mobile/features/site/domain/entities/site_entity.dart';
import 'package:sworks_mobile/network/base_response.dart';

/// 비즈니스 관련 데이터 접근을 위한 Repository 인터페이스
/// 도메인 계층에서 정의되며, 데이터 계층에 의존하지 않음
abstract class SiteRepository {
  /// 사업장 위치 목록을 가져옴
  /// 도메인 엔티티인 siteLocationEntity 리스트를 반환
  Future<BaseResponse<List<SiteEntity>>> getSites();

  /// 사용자 위치 권한 추가
  /// 도메인 엔티티인 UserPermissionEntity를 반환
  Future<BaseResponse<bool>> addUserSitePermission({int? locationId});
}
