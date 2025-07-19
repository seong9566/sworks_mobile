import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../domain/entities/manager_site_list.dart';
import '../../domain/usecase/manager_get_site_list_usecase.dart';

class ManagerSiteViewState {
  final List<ManagerSite> siteList;
  final bool isLoading;
  final int lastSiteSeq;
  final int pageSize;

  ManagerSiteViewState({
    this.siteList = const [],
    this.isLoading = false,
    this.lastSiteSeq = 0,
    this.pageSize = 10,
  });

  ManagerSiteViewState copyWith({
    List<ManagerSite>? siteList,
    bool? isLoading,
    int? lastSiteSeq,
    int? pageSize,
  }) {
    return ManagerSiteViewState(
      siteList: siteList ?? this.siteList,
      isLoading: isLoading ?? this.isLoading,
      lastSiteSeq: lastSiteSeq ?? this.lastSiteSeq,
      pageSize: pageSize ?? this.pageSize,
    );
  }
}

class ManagerSiteViewModel extends StateNotifier<ManagerSiteViewState> {
  final ManagerGetSiteListUsecase _managerGetSiteListUsecase;

  ManagerSiteViewModel(this._managerGetSiteListUsecase)
    : super(ManagerSiteViewState());

  /// 사이트 목록을 페이지네이션으로 가져오는 함수
  Future<void> getSiteList() async {
    // 로딩 상태 설정
    state = state.copyWith(isLoading: true);

    try {
      // final result = await _managerGetSiteListUsecase.call(
      //   lastSiteSeq: state.lastSiteSeq,
      //   pageSize: state.pageSize,
      // );
      final result = [
        ManagerSite(
          siteSeq: 1,
          siteName: "대명루첸",
          siteTypeSeq: 2,
          siteTypeName: '빌딩',
          siteTel: '010-1234-5678',
          siteAddress: "서울 우체국 8층",
          managerContract: [
            ManagerContractList(
              contractSeq: 1,
              serviceTypeSeq: 2,
              serviceTypeName: '미화',
              contractAmount: '10',
              contractStartDt: '2025-07-01',
              contractEndDt: '2025-12-01',
              contractStaff: '홍길동',
              contractManager: '홍길동',
              comments: '계약 담당자가 좀 까다로움',
              status: true,
            ),
          ],
        ),
      ];

      state = state.copyWith(siteList: result, isLoading: false);
    } catch (e) {
      Logger().e("사이트 목록 조회 오류: $e");
      state = state.copyWith(isLoading: false);
    }
  }
}
