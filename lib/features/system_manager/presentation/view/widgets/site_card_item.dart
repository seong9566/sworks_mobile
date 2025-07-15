import 'package:flutter/material.dart';
import 'package:sworks_mobile/core/theme/app_theme.dart';

class SiteCardItem extends StatelessWidget {
  const SiteCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      margin: EdgeInsets.only(bottom: 24, left: 16, right: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [cardBoxShadow],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "대명루첸",
            style: TextStyle(
              color: primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "일반/빌딩",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: descriptionDarkColor,
            ),
          ),
          Text(
            "보안,미화",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: descriptionDarkColor,
            ),
          ),
        ],
      ),
    );
  }
}
