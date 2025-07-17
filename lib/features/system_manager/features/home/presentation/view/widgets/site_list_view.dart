import 'package:flutter/material.dart';
import 'package:sworks_mobile/features/system_manager/features/home/presentation/view/widgets/site_card_item.dart';

class SiteListView extends StatelessWidget {
  final ScrollController scrollController;
  const SiteListView({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 24, bottom: 24),
      itemCount: 10,
      itemBuilder: (context, index) {
        return SiteCardItem();
      },
    );
  }
}
