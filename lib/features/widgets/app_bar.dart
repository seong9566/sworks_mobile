import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sworks_mobile/core/theme/app_theme.dart';

AppBar mainAppBar(BuildContext context, VoidCallback onNotificationPressed) {
  return AppBar(
    leadingWidth: MediaQuery.sizeOf(context).width * 0.3,
    leading: Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "S-TEC",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
      ),
    ),
    actions: [
      IconButton(
        onPressed: onNotificationPressed,
        icon: Icon(
          Icons.notifications_none_outlined,
          size: 24,
          color: Colors.black,
          weight: 38,
        ),
      ),
    ],
  );
}

AppBar leftBackAppBar(BuildContext context, String title) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: descriptionDarkColor,
      ),
    ),
    leading: Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          size: 24,
          color: Colors.black,
          weight: 38,
        ),
        onPressed: () => context.pop(),
      ),
    ),
  );
}
