import 'package:sworks_mobile/features/site/data/models/site_response_model.dart';
import 'package:sworks_mobile/features/site/data/models/user_permission_response_model.dart';
import 'package:sworks_mobile/network/base_response.dart';

abstract class SiteRemoteDataSource {
  /// 사업장 목록 조회
  Future<BaseResponse<List<SiteResponseModel>>> getsiteLocations();

  /// 사용자 사업장 권한 추가
  Future<BaseResponse<UserPermissionResponseModel>> addUserSitePermission({
    int? locationId,
  });
}
