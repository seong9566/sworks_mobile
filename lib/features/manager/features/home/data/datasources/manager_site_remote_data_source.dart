import 'package:sworks_mobile/features/manager/features/home/data/models/manager_site_response_model.dart';
import 'package:sworks_mobile/network/base_response.dart';

abstract class ManagerSiteRemoteDataSource {
  /// 사이트 목록을 페이지네이션으로 가져오는 메서드
  ///
  /// [lastSiteSeq] 현재 페이지에 있는 List의 마지막 인덱스 값
  /// [pageSize] 한 페이지에 몇개 출력할 것인지
  Future<BaseResponse<List<ManagerSiteResponseModel>>> getSiteLocations({
    required int lastSiteSeq,
    required int pageSize,
  });
}
