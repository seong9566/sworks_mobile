import 'package:flutter/material.dart';
import 'package:sworks_mobile/core/theme/app_theme.dart';



class DefaultButton extends StatelessWidget {
  const DefaultButton({super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
   return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          backgroundColor: WidgetStatePropertyAll<Color>(primaryColor),
        ),
        onPressed: onPressed,
        child:
            Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ), // 한글 및 스타일 추가
      ),
    );
  }
}