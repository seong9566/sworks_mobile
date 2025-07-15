import 'package:sworks_mobile/core/theme/app_theme.dart';
import 'package:sworks_mobile/features/site/presentation/providers/site_providers_di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sworks_mobile/features/site/presentation/viewmodels/site_selection_viewmodel.dart';

class SeleteSiteListView extends ConsumerStatefulWidget {
  const SeleteSiteListView({super.key});

  @override
  ConsumerState<SeleteSiteListView> createState() => _SiteListViewState();
}

class _SiteListViewState extends ConsumerState<SeleteSiteListView> {
  SiteUiModel? _selectedLocation;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(siteSelectionViewModelProvider);
    return Padding(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: state.sites.length,
        itemBuilder: (context, index) {
          final site = state.sites[index];
          final isSelected = _selectedLocation?.siteSeq == site.siteSeq;

          return selectCardItem(site.siteName, isSelected, () {
            setState(() {
              _selectedLocation = site;
              ref
                  .read(siteSelectionViewModelProvider.notifier)
                  .selectSite(site);
            });
          });
        },
      ),
    );
  }

  Widget selectCardItem(String title, bool isSelected, VoidCallback onTap) {
    final TextStyle textStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: isSelected ? Colors.white : descriptionDarkColor,
    );
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        margin: EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderGrayColor),
        ),
        child: Text(title, style: textStyle),
      ),
    );
  }
}
