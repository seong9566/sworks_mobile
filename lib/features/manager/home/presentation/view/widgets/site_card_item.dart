import 'package:flutter/material.dart';
import 'package:sworks_mobile/core/theme/app_theme.dart';
import 'package:sworks_mobile/features/manager/home/domain/entities/manager_site_list.dart';

class SiteCardItem extends StatelessWidget {
  final ManagerSite site;
  const SiteCardItem({super.key, required this.site});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
      margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderGrayColor, width: 1),
      ),
      child: Row(
        children: [
          // 첫 번째 열: 사이트명 (30%)
          Expanded(
            flex: 4,
            child: Text(
              site.siteName,
              style: TextStyle(
                color: primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: Text(
              site.siteTypeName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: descriptionDarkColor,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          // 세 번째 열: 계약 서비스 유형 (40%)
          Expanded(
            flex: 4,
            child: Text(
              site.contractServiceTypeNames,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: descriptionDarkColor,
              ),
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
