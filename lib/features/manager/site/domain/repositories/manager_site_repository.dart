import 'package:sworks_mobile/network/base_response.dart';

import '../entities/manager_site_entity.dart';

abstract class ManagerSiteRepository {
  /// 사이트 목록을 페이지네이션으로 가져오는 메서드
  ///
  /// [lastSiteSeq] 현재 페이지에 있는 List의 마지막 인덱스 값
  /// [pageSize] 한 페이지에 몇개 출력할 것인지
  Future<BaseResponse<List<ManagerSiteEntity>>> getSiteLocations({
    required int lastSiteSeq,
    required int pageSize,
  });
}
