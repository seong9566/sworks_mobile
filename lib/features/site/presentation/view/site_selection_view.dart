import 'package:sworks_mobile/core/theme/app_theme.dart';
import 'package:sworks_mobile/features/auth/presentation/viewmodels/login_viewmodel.dart';
import 'package:sworks_mobile/features/site/presentation/providers/site_providers_di.dart';
import 'package:sworks_mobile/features/site/presentation/view/widgets/site_list_view.dart';
import 'package:sworks_mobile/features/site/presentation/viewmodels/site_selection_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SiteSelectionView extends ConsumerStatefulWidget {
  const SiteSelectionView({super.key});

  @override
  ConsumerState<SiteSelectionView> createState() => _SiteSelectionViewState();
}

class _SiteSelectionViewState extends ConsumerState<SiteSelectionView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(siteSelectionViewModelProvider.notifier).getsiteLocations();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(siteSelectionViewModelProvider);
    return Scaffold(
      appBar: AppBar(title: Text('사업장 선택', style: titleStyle)),
      body: _body(state),
      bottomNavigationBar: _bottomNavigationBar(state),
    );
  }

  Widget _body(SiteSelectionState state) {
    switch (state.status) {
      case SiteSelectionStatusEnum.initial:
      case SiteSelectionStatusEnum.loading:
        return const Center(child: CircularProgressIndicator());
      case SiteSelectionStatusEnum.error:
        return _errorWidget(state);
      case SiteSelectionStatusEnum.success:
        return state.sites.isEmpty
            ? const Center(child: Text('사업장 목록이 없습니다'))
            : SiteListView(sites: state.sites);
    }
  }

  Center _errorWidget(SiteSelectionState state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            state.errorMessage ?? '오류가 발생했습니다',
            style: const TextStyle(color: Colors.red),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(siteSelectionViewModelProvider.notifier)
                  .getsiteLocations();
            },
            child: const Text('다시 시도'),
          ),
        ],
      ),
    );
  }

  Widget _bottomNavigationBar(SiteSelectionState state) {
    final bool isButtonEnabled = state.selecteSite != null;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultHPadding),
        child: ElevatedButton(
          onPressed: isButtonEnabled
              ? () async {
                  // 로딩 표시를 위한 다이얼로그 표시
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) =>
                        const Center(child: CircularProgressIndicator()),
                  );

                  try {
                    // 비동기로 사업장 추가 요청
                    await ref
                        .read(siteSelectionViewModelProvider.notifier)
                        .addsiteLocation(LoginStatusEnum.manager);

                    // 현재 상태 확인
                    final currentState = ref.read(
                      siteSelectionViewModelProvider,
                    );

                    // 로딩 다이얼로그 닫기
                    if (context.mounted) Navigator.of(context).pop();

                    // 성공 시에만 화면 이동
                    if (currentState.status ==
                        SiteSelectionStatusEnum.success) {
                      if (context.mounted) context.goNamed('calendar');
                    } else {
                      // 실패 시 스낵바 표시
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              currentState.errorMessage ?? '권한 추가에 실패했습니다',
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
                  } catch (e) {
                    // 예외 발생 시 로딩 다이얼로그 닫기 및 스낵바 표시
                    if (context.mounted) Navigator.of(context).pop();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('오류가 발생했습니다: ${e.toString()}'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                }
              : null,
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            minimumSize: WidgetStatePropertyAll(Size(double.infinity, 56)),
            backgroundColor: WidgetStatePropertyAll(
              isButtonEnabled ? primaryColor : Colors.grey.shade300,
            ),
          ),
          child: Text(
            '확인',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: isButtonEnabled ? Colors.white : Colors.grey.shade600,
            ),
          ),
        ),
      ),
    );
  }
}
