import 'package:sworks_mobile/core/theme/app_theme.dart' ;
import 'package:sworks_mobile/features/site/presentation/providers/site_providers_di.dart';
import 'package:flutter/material.dart';
import 'package:sworks_mobile/features/site/domain/entities/site_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SiteListView extends ConsumerStatefulWidget {
  const SiteListView({super.key, required this.sites});

  final List<SiteEntity> sites;

  @override
  ConsumerState<SiteListView> createState() => _SiteListViewState();
}

class _SiteListViewState extends ConsumerState<SiteListView> {
  SiteEntity? _selectedLocation;

  /// 사업장 선택 처리
  void selectItem(SiteEntity location) {
    setState(() {
      _selectedLocation = location;
    });
    ref.read(siteSelectionViewModelProvider.notifier).selectSite(location);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(p16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: widget.sites.length,
          itemBuilder: (context, index) {
            final site = widget.sites[index];
            final isSelected = _selectedLocation?.siteSeq == site.siteSeq;

            return selectCardItem(site.siteName, isSelected, () {
              selectItem(site);
            });
          },
        ),
      ),
    );
  }

  Widget selectCardItem(String title, bool isSelected, VoidCallback onTap) {
    final TextStyle textStyle = TextStyle(
      fontSize: 18,
      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      color: isSelected ? Colors.white : Colors.black,
    );
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 12),
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderSideColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(title, style: textStyle)],
        ),
      ),
    );
  }
}
