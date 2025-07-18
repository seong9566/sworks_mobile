import '../entities/manager_site_list.dart';
import '../repositories/manager_site_repository.dart';

class ManagerGetSiteListUsecase {
  final ManagerSiteRepository _repository;

  ManagerGetSiteListUsecase(this._repository);

  /// 사이트 목록을 페이지네이션으로 가져오는 UseCase
  ///
  /// [lastSiteSeq] 현재 페이지에 있는 List의 마지막 인덱스 값
  /// [pageSize] 한 페이지에 몇개 출력할 것인지
  Future<List<ManagerSite>> call({
    required int lastSiteSeq,
    required int pageSize,
  }) async {
    final response = await _repository.getSiteLocations(
      lastSiteSeq: lastSiteSeq,
      pageSize: pageSize,
    );

    return response.data
        .map((entity) => ManagerSite.fromEntity(entity))
        .toList();
  }
}
