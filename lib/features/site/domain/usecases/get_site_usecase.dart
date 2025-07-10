import 'package:sworks_mobile/features/site/domain/entities/site_entity.dart';
import 'package:sworks_mobile/features/site/domain/entities/site_result.dart';
import 'package:sworks_mobile/features/site/domain/repositories/site_repository.dart';
import 'package:sworks_mobile/network/base_response.dart';

/// 사업장 목록 조회 유스케이스
class GetSiteUseCase {
  final SiteRepository _repository;

  GetSiteUseCase(this._repository);

  /// 사업장 목록 조회
  ///
  /// 반환값: [SiteResult] 사업장 목록 조회 결과 정보
  Future<SiteResult> execute() async {
    try {
      // API 호출
      final response = await _repository.getSites();

      // 응답 처리 및 결과 반환
      return _processResponse(response);
    } catch (e) {
      // 기타 예외 발생 시 실패 결과 반환
      return SiteResult.failure(message: e.toString());
    }
  }

  /// 응답 처리 및 결과 변환
  SiteResult _processResponse(BaseResponse<List<SiteEntity>> response) {
    if (response.code == 200) {
      return SiteResult.success(
        locations: response.data,
        code: response.code,
        message: response.message,
      );
    } else {
      return SiteResult.failure(message: response.message, code: response.code);
    }
  }
}
