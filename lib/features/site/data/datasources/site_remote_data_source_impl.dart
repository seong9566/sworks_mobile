import 'package:sworks_mobile/features/site/data/models/site_response_model.dart';
import 'package:sworks_mobile/features/site/data/models/user_permission_response_model.dart';
import 'package:sworks_mobile/features/site/data/datasources/site_remote_data_source.dart';
import 'package:sworks_mobile/network/api_endpoint.dart';
import 'package:sworks_mobile/network/api_error.dart';
import 'package:sworks_mobile/network/base_response.dart';
import 'package:sworks_mobile/network/dio_client.dart';
import 'package:dio/dio.dart';

class SiteRemoteDataSourceImpl implements SiteRemoteDataSource {
  final DioClient _dioClient;

  SiteRemoteDataSourceImpl(this._dioClient);

  @override
  Future<BaseResponse<List<SiteResponseModel>>> getsiteLocations() async {
    try {
      final response = await _dioClient.get(ApiEndPoint.siteLocations);
      final Map<String, dynamic> responseData =
          response.data as Map<String, dynamic>;
      return BaseResponse.fromJson(
        responseData,
        (json) => (json as List)
            .map(
              (item) =>
                  SiteResponseModel.fromJson(item as Map<String, dynamic>),
            )
            .toList(),
      );
    } on DioException catch (e) {
      return ApiError.handleDioException<List<SiteResponseModel>>(
        e,
        (json) => (json as List)
            .map(
              (item) =>
                  SiteResponseModel.fromJson(item as Map<String, dynamic>),
            )
            .toList(),
        SiteResponseModel.emptyList(),
      );
    } catch (e) {
      return ApiError.handleGeneralException<List<SiteResponseModel>>(
        e,
        SiteResponseModel.emptyList(),
      );
    }
  }

  @override
  Future<BaseResponse<UserPermissionResponseModel>> addUserSitePermission({
    int? locationId,
  }) async {
    try {
      final response = await _dioClient.post(
        ApiEndPoint.addUserLocationPermission,
        data: {"locationId": locationId},
      );
      final Map<String, dynamic> responseData =
          response.data as Map<String, dynamic>;

      return BaseResponse<UserPermissionResponseModel>.fromJson(
        responseData,
        (json) =>
            UserPermissionResponseModel.fromJson(json as Map<String, dynamic>),
      );
    } on DioException catch (e) {
      return ApiError.handleDioException<UserPermissionResponseModel>(
        e,
        (json) => UserPermissionResponseModel.fromJson(json),
        UserPermissionResponseModel.empty(),
      );
    } catch (e) {
      return ApiError.handleGeneralException<UserPermissionResponseModel>(
        e,
        UserPermissionResponseModel.empty(),
      );
    }
  }
}
