import 'package:sworks_mobile/core/storage/secure_storage_util.dart';
import 'package:sworks_mobile/features/site/data/datasources/site_remote_data_source.dart';
import 'package:sworks_mobile/features/site/data/models/site_response_model.dart';
import 'package:sworks_mobile/features/site/domain/entities/site_entity.dart';
import 'package:sworks_mobile/features/site/domain/repositories/site_repository.dart';
import 'package:sworks_mobile/network/base_response.dart';

class SiteRepositoryImpl implements SiteRepository {
  final siteRemoteDataSource _remoteDataSource;

  SiteRepositoryImpl(this._remoteDataSource);

  @override
  Future<BaseResponse<List<SiteEntity>>> getSites() async {
    final response = await _remoteDataSource.getsiteLocations();
    return BaseResponse<List<SiteEntity>>(
      code: response.code,
      message: response.message,
      data: response.data.map((model) => model.toEntity()).toList(),
    );
  }

  @override
  Future<BaseResponse<bool>> addUserSitePermission({int? locationId}) async {
    final response = await _remoteDataSource.addUserSitePermission(
      locationId: locationId,
    );

    if (response.code == 200) {
      // 사용자 권한 정보를 SecureStorage에 저장
      await SecureStorageUtil.saveUserPermission(response.data);
      return BaseResponse<bool>(
        code: response.code,
        message: response.message,
        data: true,
      );
    }
    return BaseResponse<bool>(
      code: response.code,
      message: response.message,
      data: false,
    );
  }
}
