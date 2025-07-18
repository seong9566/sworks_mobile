import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:sworks_mobile/features/manager/home/domain/entities/manager_site_list.dart';
import 'package:sworks_mobile/features/manager/home/domain/usecase/manager_get_site_list_usecase.dart';

class SystemManagerHomeState {
  final int tabIndex;
  final List<ManagerSite> siteList;
  final bool isLoading;
  final int lastSiteSeq;
  final int pageSize;

  SystemManagerHomeState({
    this.tabIndex = 0,
    this.siteList = const [],
    this.isLoading = false,
    this.lastSiteSeq = 0,
    this.pageSize = 10,
  });

  SystemManagerHomeState copyWith({
    int? tabIndex,
    List<ManagerSite>? siteList,
    bool? isLoading,
    int? lastSiteSeq,
    int? pageSize,
  }) {
    return SystemManagerHomeState(
      tabIndex: tabIndex ?? this.tabIndex,
      siteList: siteList ?? this.siteList,
      isLoading: isLoading ?? this.isLoading,
      lastSiteSeq: lastSiteSeq ?? this.lastSiteSeq,
      pageSize: pageSize ?? this.pageSize,
    );
  }
}

class SystemManagerViewModel extends StateNotifier<SystemManagerHomeState> {
  final ManagerGetSiteListUsecase _managerGetSiteListUsecase;

  SystemManagerViewModel(this._managerGetSiteListUsecase)
    : super(SystemManagerHomeState());

  void changeTab(int tabIndex) {
    Logger().d("tabIndex: $tabIndex");
    state = state.copyWith(tabIndex: tabIndex);
  }

  /// 사이트 목록을 페이지네이션으로 가져오는 함수
  ///
  /// [refresh]가 true인 경우 목록을 초기화하고 처음부터 다시 가져옴
  Future<void> getSiteList({bool refresh = false}) async {
    // 로딩 상태 설정
    state = state.copyWith(isLoading: true);

    try {
      final result = await _managerGetSiteListUsecase.call(
        lastSiteSeq: state.lastSiteSeq,
        pageSize: state.pageSize,
      );

      state = state.copyWith(siteList: result, isLoading: false);
    } catch (e) {
      Logger().e("사이트 목록 조회 오류: $e");
      state = state.copyWith(isLoading: false);
    }
  }
}
