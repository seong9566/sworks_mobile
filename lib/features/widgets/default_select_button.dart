import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';

class DefaultSelectButton extends StatelessWidget {
  final String title;
  final Widget icon;
  final bool isExpanded;
  final void Function() onTap;
  const DefaultSelectButton({
    super.key,
    required this.title,
    required this.isExpanded,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        padding: const EdgeInsets.only(left: 16, right: 8, bottom: 8, top: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: borderGrayColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: descriptionDarkColor,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            isExpanded ? const Spacer() : const SizedBox(width: 16),
            icon,
          ],
        ),
      ),
    );
  }
}
