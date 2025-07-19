import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sworks_mobile/core/theme/app_theme.dart';
import 'package:sworks_mobile/features/widgets/app_bar.dart';
import 'package:sworks_mobile/features/widgets/default_floating_action_button.dart';
import 'package:sworks_mobile/features/widgets/default_tab_bar.dart';

import '../../../site/view/manager_site_view.dart';
import '../providers/manager_home_providers_di.dart';

class SystemManagerHomeView extends ConsumerStatefulWidget {
  const SystemManagerHomeView({super.key});

  @override
  ConsumerState<SystemManagerHomeView> createState() =>
      _SystemManagerHomeViewState();
}

class _SystemManagerHomeViewState extends ConsumerState<SystemManagerHomeView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController siteScrollController;
  double siteScrollPosition = 0.0;

  @override
  void initState() {
    super.initState();

    siteScrollController = ScrollController();
    _tabController = TabController(length: 2, vsync: this);

    /// TabBar 리스너
    _tabController.addListener(() {
      ref
          .read(managerViewModelProvider.notifier)
          .changeTab(_tabController.index);
    });

    /// Scroll 리스너
    siteScrollController.addListener(() {
      double current = siteScrollController.position.pixels;
      if ((current - siteScrollPosition).abs() > 5) {
        setState(() {
          siteScrollPosition = current;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context, () {}),
      body: _body(),
      floatingActionButton: _floatingActionButton(),
    );
  }

  Widget _body() {
    return Column(children: [_tabBar(), _tabBarView()]);
  }

  Widget _tabBar() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: borderGrayColor)),
      ),
      child: Row(
        children: [
          Expanded(
            child: DefaultTabBar(
              tabController: _tabController,
              firstTabText: '사업장',
              secondTabText: '관리자',
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabBarView() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: [
          ManagerSiteView(scrollController: siteScrollController),
          Center(child: Text('관리자')),
        ],
      ),
    );
  }

  Widget _floatingActionButton() {
    return ref.watch(managerViewModelProvider).tabIndex == 0
        ? SizedBox()
        : DefaultFloatingActionButton(
            scrollPosition: siteScrollPosition,
            title: '관리자 추가',
            onPressed: () {},
          );
  }
}
