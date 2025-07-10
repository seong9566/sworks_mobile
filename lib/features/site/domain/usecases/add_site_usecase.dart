import 'package:sworks_mobile/features/site/domain/repositories/site_repository.dart';
import 'package:sworks_mobile/network/base_response.dart';

/// 사업장 위치 권한 추가 UseCase
class AddSiteUseCase {
  final SiteRepository _repository;

  AddSiteUseCase(this._repository);

  /// 사업장 위치 권한 추가 실행
  /// [locationId] 사업장 ID
  Future<BaseResponse<bool>> execute({int? locationId}) async {
    try {
      // 권한 추가 요청
      final response = await _repository.addUserSitePermission(
        locationId: locationId,
      );
      return _processResponse(response);
    } catch (e) {
      return BaseResponse<bool>(code: 500, message: e.toString(), data: false);
    }
  }

  /// 응답 처리 및 결과 변환
  BaseResponse<bool> _processResponse(BaseResponse<bool> response) {
    if (response.code == 200) {
      return BaseResponse<bool>(
        code: response.code,
        message: response.message,
        data: true,
      );
    } else {
      /// 데이터 Secure에 저장 실패 시 false 반환
      return BaseResponse<bool>(
        code: response.code,
        message: response.message,
        data: false,
      );
    }
  }
}
