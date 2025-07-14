import 'package:flutter/material.dart';

class AppTheme {
  /// 라이트 모드: 텍스트 테마만 Manrope 폰트로 적용
  static ThemeData get lightTheme {
    final base = ThemeData(
      fontFamily: 'Pretendard',
      scaffoldBackgroundColor: scaffoldColor,
      brightness: Brightness.light,
      useMaterial3: false,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
    );
    return base.copyWith(
      scaffoldBackgroundColor: base.scaffoldBackgroundColor,
      primaryTextTheme: base.primaryTextTheme,
      appBarTheme: base.appBarTheme.copyWith(
        titleTextStyle: TextStyle(
          color: primaryColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'Pretendard',
        ),
      ),
    );
  }

  /// 다크 모드: 텍스트 테마만 Manrope 폰트로 적용
  static ThemeData get darkTheme {
    final base = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      brightness: Brightness.dark,
      useMaterial3: false,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
    );
    return base.copyWith(
      appBarTheme: base.appBarTheme.copyWith(
        titleTextStyle: TextStyle(
          color: primaryColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'Pretendard',
        ),
      ),
    );
  }
}

 const TextStyle titleStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);
const double p16 = 16;
const Color unSelectColor = Color(0xff61758A);
const Color selectColor = Color(0xff121417);
const Color indicatorColor = Color(0xffc4cdd8);
const Color borderSideColor = Color(0xffE0E0E0);
const Color primaryColor = Color(0xff223377);
const Color scaffoldColor = Color(0xffFBFCFF);
const Color grayBorderColor = Color(0xffE7E5E4);
