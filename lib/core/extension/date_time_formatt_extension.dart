extension DateTimeFormattExtension on DateTime {
  /// 예) 2025년 6월 10일 (화)
  String toKoreanDate() {
    const weekdays = ['월', '화', '수', '목', '금', '토', '일'];
    final w = weekdays[weekday - 1];
    return '$year년 $month월 $day일 ($w)';
  }

  /// 시간 정보를 제거한 DateTime 객체를 반환합니다 (날짜 비교용)
  DateTime dateOnly() {
    return DateTime(year, month, day);
  }
}
