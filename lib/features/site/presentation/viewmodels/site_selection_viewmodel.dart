import 'package:sworks_mobile/features/auth/presentation/viewmodels/login_viewmodel.dart';
import 'package:sworks_mobile/features/site/domain/entities/site_result.dart';
import 'package:sworks_mobile/features/site/domain/usecases/add_site_usecase.dart';
import 'package:sworks_mobile/features/site/domain/usecases/get_site_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 비즈니스 선택 화면의 상태
enum SiteSelectionStatusEnum { initial, loading, success, error }

class SiteUiModel {
  final String siteName;
  final int siteSeq;
  final bool isSelected;
  const SiteUiModel({
    required this.siteName,
    required this.siteSeq,
    required this.isSelected,
  });
}

/// 비즈니스 선택 화면의 상태 클래스
class SiteSelectionState {
  /// 현재 상태
  final SiteSelectionStatusEnum status;

  /// 사업장 목록
  final List<SiteUiModel> sites;

  /// 선택된 사업장
  final SiteUiModel? selecteSite;

  /// 오류 메시지
  final String? errorMessage;

  const SiteSelectionState({
    required this.status,
    required this.sites,
    this.selecteSite,
    this.errorMessage,
  });

  /// 초기 상태 생성 팩토리 메서드
  factory SiteSelectionState.initial() => const SiteSelectionState(
    status: SiteSelectionStatusEnum.initial,
    sites: [],
  );

  /// 상태 복사 메서드
  SiteSelectionState copyWith({
    SiteSelectionStatusEnum? status,
    List<SiteUiModel>? sites,
    SiteUiModel? selecteSite,
    String? errorMessage,
    bool clearSelectedLocation = false,
    bool clearErrorMessage = false,
  }) {
    return SiteSelectionState(
      status: status ?? this.status,
      sites: sites ?? this.sites,
      selecteSite: clearSelectedLocation ? null : (selecteSite ?? selecteSite),
      errorMessage: clearErrorMessage
          ? null
          : (errorMessage ?? this.errorMessage),
    );
  }
}

/// 사업장 선택 화면의 ViewModel
class SiteSelectionViewModel extends StateNotifier<SiteSelectionState> {
  final GetSiteUseCase _getsiteLocationsUseCase;
  final AddSiteUseCase _addsiteLocationUseCase;

  SiteSelectionViewModel(
    this._getsiteLocationsUseCase,
    this._addsiteLocationUseCase,
  ) : super(SiteSelectionState.initial());

  /// 사업장 목록 조회
  Future<void> getsiteLocations() async {
    // 로딩 상태로 변경
    state = state.copyWith(status: SiteSelectionStatusEnum.loading);

    try {
      // UseCase 실행 - siteLocationsResult 반환
      final result = await _getsiteLocationsUseCase.execute();

      if (result.type == SiteResultType.success) {
        // 성공: 위치 목록과 권한 정보 업데이트
        state = state.copyWith(
          status: SiteSelectionStatusEnum.success,
          sites:
              result.locations
                  ?.map(
                    (e) => SiteUiModel(
                      siteName: e.siteName,
                      siteSeq: e.siteSeq,
                      isSelected: false,
                    ),
                  )
                  .toList() ??
              [],
          clearErrorMessage: true,
        );
      } else {
        // 실패: 오류 메시지 업데이트
        state = state.copyWith(
          status: SiteSelectionStatusEnum.error,
          errorMessage: result.message ?? '사업장 목록을 가져오는 중 오류가 발생했습니다',
        );
      }
    } catch (e) {
      // 예외 처리
      state = state.copyWith(
        status: SiteSelectionStatusEnum.error,
        errorMessage: e.toString(),
      );
    }
  }

  /// 사업장 위치 권한 추가
  Future<void> addsiteLocation(LoginStatusEnum loginStatusEnum) async {
    // 로딩 상태로 변경
    state = state.copyWith(status: SiteSelectionStatusEnum.loading);

    try {
      // UseCase 실행 - UserPermissionEntity 반환
      if (loginStatusEnum == LoginStatusEnum.user) {
        // 일반 사용자는 locationId 없이 호출
        await _addsiteLocationUseCase.execute();
      } else {
        // 관리자는 선택한 사업장 ID로 호출
        await _addsiteLocationUseCase.execute(
          locationId: state.selecteSite?.siteSeq,
        );
      }

      state = state.copyWith(
        status: SiteSelectionStatusEnum.success,
        clearErrorMessage: true,
      );
    } catch (e) {
      // 예외 처리
      state = state.copyWith(
        status: SiteSelectionStatusEnum.error,
        errorMessage: e.toString(),
      );
    }
  }

  /// 사업장 선택
  void selectSite(SiteUiModel site) {
    state = state.copyWith(selecteSite: site);
  }
}
