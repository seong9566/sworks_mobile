import 'package:flutter/material.dart';

class TodoSliverHeader extends StatelessWidget {
  final String title;
  final double height;
  final Color backgroundColor;
  final VoidCallback onTap;
  final bool isExpanded;
  final bool pinned;
  const TodoSliverHeader({
    super.key,
    required this.title,
    this.height = 50.0,
    this.backgroundColor = Colors.white,
    required this.onTap,
    required this.isExpanded,
    this.pinned = true,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: pinned,
      delegate: SliverHeaderDelegate(
        title: title,
        height: height,
        backgroundColor: backgroundColor,
        onTap: onTap,
        isExpanded: isExpanded,
      ),
    );
  }
}

/// 고정 헤더를 위한 위젯 클래스
class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final double height;
  final Color backgroundColor;
  final VoidCallback onTap;
  final bool isExpanded;

  SliverHeaderDelegate({
    required this.title,
    this.height = 50.0,
    this.backgroundColor = Colors.white,
    required this.onTap,
    required this.isExpanded,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    // 컨테이너 높이를 명시적으로 지정하여 layoutExtent와 paintExtent가 일치하도록 함
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        color: backgroundColor,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AnimatedRotation(
                turns: isExpanded ? 0.5 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverHeaderDelegate oldDelegate) =>
      oldDelegate.title != title ||
      oldDelegate.height != height ||
      oldDelegate.backgroundColor != backgroundColor ||
      oldDelegate.isExpanded != isExpanded;
}
