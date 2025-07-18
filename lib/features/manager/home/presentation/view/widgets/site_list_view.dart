import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sworks_mobile/features/manager/home/presentation/providers/system_manager_providers_di.dart';
import 'package:sworks_mobile/features/manager/home/presentation/view/widgets/site_card_item.dart';

class SiteListView extends ConsumerWidget {
  final ScrollController scrollController;
  const SiteListView({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(systemManagerViewModelProvider);
    return ListView.builder(
      controller: scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 24, bottom: 24),
      itemCount: state.siteList.length,
      itemBuilder: (context, index) {
        return SiteCardItem(site: state.siteList[index]);
      },
    );
  }
}
