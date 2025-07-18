import 'package:sworks_mobile/features/manager/home/data/datasources/manager_site_remote_data_source.dart';
import 'package:sworks_mobile/features/manager/home/data/models/manager_site_response_model.dart';
import 'package:sworks_mobile/features/manager/home/domain/entities/manager_site_entity.dart';
import 'package:sworks_mobile/features/manager/home/domain/repositories/manager_site_repository.dart';
import 'package:sworks_mobile/network/base_response.dart';

class ManagerSiteRepositoryImpl implements ManagerSiteRepository {
  final ManagerSiteRemoteDataSource _remoteDataSource;

  ManagerSiteRepositoryImpl(this._remoteDataSource);

  @override
  Future<BaseResponse<List<ManagerSiteEntity>>> getSiteLocations({
    required int lastSiteSeq,
    required int pageSize,
  }) async {
    final response = await _remoteDataSource.getSiteLocations(
      lastSiteSeq: lastSiteSeq,
      pageSize: pageSize,
    );
    final entities = response.data.map((model) => model.toEntity()).toList();
    return BaseResponse<List<ManagerSiteEntity>>(
      code: response.code,
      message: response.message,
      data: entities,
    );
  }
}
