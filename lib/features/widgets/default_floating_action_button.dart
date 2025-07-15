import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:sworks_mobile/core/theme/app_theme.dart';

class DefaultFloatingActionButton extends StatefulWidget {
  final double scrollPosition;
  final String title;
  final VoidCallback onPressed;

  const DefaultFloatingActionButton({
    super.key,
    required this.scrollPosition,
    required this.title,
    required this.onPressed,
  });

  @override
  State<DefaultFloatingActionButton> createState() =>
      _DefaultFloatingActionButtonState();
}

class _DefaultFloatingActionButtonState
    extends State<DefaultFloatingActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  double _textWidth = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.7, curve: Curves.easeOut),
      ),
    );

    _textWidth = _getTextWidth(widget.title, 16.0, FontWeight.bold);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(DefaultFloatingActionButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.scrollPosition > 0) {
      _controller.forward();
    } else {
      _controller.reverse();
    }

    if (oldWidget.title != widget.title) {
      _textWidth = _getTextWidth(widget.title, 16.0, FontWeight.bold);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          // 버튼 크기 계산
          final double buttonSize = 48.0; // 기본 버튼 높이
          final double minWidth = buttonSize; // 접혔을 때 너비
          final double maxWidth = buttonSize + 12.0 + _textWidth; // 펼쳤을 때 너비
          final double currentWidth =
              minWidth + (maxWidth - minWidth) * (1 - _controller.value);

          return Container(
            width: currentWidth,
            height: buttonSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48),
              color: primaryColor,
              boxShadow: [cardBoxShadow],
            ),

            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 10,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Icon(Icons.add, color: Colors.white, size: 28),
                  ),
                ),
                Positioned(
                  left: 48, // 아이콘 너비 + 여백
                  top: 0,
                  bottom: 0,
                  child: ClipRect(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      widthFactor: 1.0 - _controller.value,
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: Center(
                          child: Text(
                            widget.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  double _getTextWidth(String text, double fontSize, FontWeight fontWeight) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      ),
      maxLines: 1,
      textDirection: ui.TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    return textPainter.width;
  }
}
