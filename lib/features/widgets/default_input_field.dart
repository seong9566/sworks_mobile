import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';

class DefaultInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isReadOnly;
  final IconData? suffixIcon;
  final Function? onSuffixIconPressed;
  const DefaultInputField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isReadOnly = false,
    this.suffixIcon,
    this.onSuffixIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.name,
        readOnly: isReadOnly,
        decoration: InputDecoration(
          // suffixIcon: isPassword
          //     ? IconButton(
          //   icon: Icon(
          //     isPasswordVisible
          //         ? Icons.visibility_off
          //         : Icons.visibility,
          //     color: primaryColor,
          //   ),
          //   onPressed: onSuffixIconPressed,
          // )
          //     : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: borderGrayColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: isReadOnly ? borderGrayColor : primaryColor,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 16,
            color: isReadOnly ? descriptionDarkColor : grayDarkColor,
          ),
          filled: true,
          fillColor: inputFieldColor,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: borderGrayColor),
          ),
        ),
      ),
    );
  }
}
