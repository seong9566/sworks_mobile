import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sworks_mobile/features/manager/site/view/providers/manager_site_providers_di.dart';
import 'package:sworks_mobile/features/manager/site/view/widgets/site_card_item.dart';

class ManagerSiteView extends ConsumerStatefulWidget {
  final ScrollController scrollController;
  const ManagerSiteView({super.key, required this.scrollController});

  @override
  ConsumerState<ManagerSiteView> createState() => _ManagerSiteViewState();
}

class _ManagerSiteViewState extends ConsumerState<ManagerSiteView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(managerSiteViewModelProvider.notifier).getSiteList();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(managerSiteViewModelProvider);
    return ListView.builder(
      controller: widget.scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 24, bottom: 24),
      itemCount: state.siteList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.goNamed('site-edit', extra: state.siteList[index]);
          },
          child: SiteCardItem(site: state.siteList[index]),
        );
      },
    );
  }
}
