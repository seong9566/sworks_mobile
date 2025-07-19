import 'package:flutter/material.dart';
import 'package:sworks_mobile/core/theme/app_theme.dart';

class DefaultTabBar extends StatelessWidget {
  final String firstTabText;
  final String secondTabText;
  const DefaultTabBar({
    super.key,
    required this.tabController,
    required this.firstTabText,
    required this.secondTabText,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: scaffoldColor,
      child: TabBar(
        physics: const NeverScrollableScrollPhysics(),
        unselectedLabelStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
        labelStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: descriptionDarkColor,
        ),
        indicator: UnderlineTabIndicator(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(width: 3, color: primaryColor),
        ),
        indicatorPadding: EdgeInsets.symmetric(horizontal: 48),
        controller: tabController,
        tabs: [
          Tab(child: Text(firstTabText)),
          Tab(child: Text(secondTabText)),
        ],
      ),
    );
  }
}
