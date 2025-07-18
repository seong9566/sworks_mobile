import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:sworks_mobile/features/manager/features/home/data/datasources/manager_site_remote_data_source.dart';
import 'package:sworks_mobile/features/manager/features/home/data/models/manager_site_response_model.dart';
import 'package:sworks_mobile/network/api_error.dart';
import 'package:sworks_mobile/network/base_response.dart';
import 'package:sworks_mobile/network/dio_client.dart';
import 'package:sworks_mobile/network/api_endpoint.dart';

class ManagerSiteRemoteDataSourceImpl implements ManagerSiteRemoteDataSource {
  final DioClient _dioClient;

  ManagerSiteRemoteDataSourceImpl(this._dioClient);

  @override
  Future<BaseResponse<List<ManagerSiteResponseModel>>> getSiteLocations({
    required int lastSiteSeq,
    required int pageSize,
  }) async {
    // 페이지네이션 파라미터 추가
    final queryParams = {'lastSiteSeq': lastSiteSeq, 'pageSize': pageSize};

    try {
      final response = await _dioClient.get(
        ApiEndPoint.allSiteList,
        queryParameters: queryParams,
      );

      final Map<String, dynamic> responseData = response.data;

      // data가 없으면 빈 리스트로 처리
      final items =
          responseData['data'] != null && responseData['data']['items'] != null
          ? responseData['data']['items'] as List<dynamic>
          : [];

      final parsedItems = items
          .map(
            (item) =>
                ManagerSiteResponseModel.fromJson(item as Map<String, dynamic>),
          )
          .toList();

      return BaseResponse<List<ManagerSiteResponseModel>>(
        message: responseData['message'],
        data: parsedItems,
        code: responseData['code'],
      );
    } on DioException catch (e) {
      return ApiError.handleGeneralException<List<ManagerSiteResponseModel>>(
        e,
        [],
      );
    } catch (e) {
      return ApiError.handleGeneralException<List<ManagerSiteResponseModel>>(
        e,
        [],
      );
    }
  }
}
