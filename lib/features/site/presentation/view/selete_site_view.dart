import 'package:sworks_mobile/core/theme/app_theme.dart';
import 'package:sworks_mobile/features/auth/presentation/viewmodels/login_viewmodel.dart';
import 'package:sworks_mobile/features/site/presentation/providers/site_providers_di.dart';
import 'package:sworks_mobile/features/site/presentation/view/widgets/select_site_list_view.dart';
import 'package:sworks_mobile/features/site/presentation/viewmodels/site_selection_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sworks_mobile/features/widgets/default_button.dart';

class SeleteSiteView extends ConsumerStatefulWidget {
  const SeleteSiteView({super.key});

  @override
  ConsumerState<SeleteSiteView> createState() => _SiteSelectionViewState();
}

class _SiteSelectionViewState extends ConsumerState<SeleteSiteView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(siteSelectionViewModelProvider.notifier).getsiteLocations();
    });
  }

  Future<void> _onPressed() async {
    try {
      await ref
          .read(siteSelectionViewModelProvider.notifier)
          .addsiteLocation(LoginStatusEnum.manager);
      // 현재 상태 확인
      final currentState = ref.read(siteSelectionViewModelProvider);
      // 성공 시에만 화면 이동
      if (currentState.status == SiteSelectionStatusEnum.success) {
        if (mounted) context.goNamed('system-manager');
      }
    } catch (e) {
      // 예외 발생 시 로딩 다이얼로그 닫기 및 스낵바 표시
      if (mounted) Navigator.of(context).pop();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('오류가 발생했습니다: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(siteSelectionViewModelProvider);
    return Scaffold(
      appBar: AppBar(title: Text('사업장 선택', style: appBarTitleStyle)),
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
            : SeleteSiteListView();
    }
  }

  Widget _errorWidget(SiteSelectionState state) {
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
        padding: EdgeInsets.only(bottom: 24, left: 16, right: 16),
        child: DefaultButton(
          onPressed: isButtonEnabled
              ? () async {
                  await _onPressed();
                }
              : () {},
          text: '선택 완료',
        ),
      ),
    );
  }
}
