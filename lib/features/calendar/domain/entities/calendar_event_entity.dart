import 'dart:core';

/// 캘린더 이벤트 엔티티
///
/// 캘린더에 표시될 이벤트의 도메인 모델입니다.
class CalendarEventEntity {
  String scheduleId;
  String title;
  String description;
  int siteId;
  int clientId;
  int codeId;
  bool isAllDay;
  DateTime startDate;
  DateTime endDate;
  String viewColor;
  bool alarmYn;

  CalendarEventEntity({
    required this.scheduleId,
    required this.title,
    required this.description,
    required this.siteId,
    required this.clientId,
    required this.codeId,
    required this.isAllDay,
    required this.startDate,
    required this.endDate,
    required this.viewColor,
    required this.alarmYn,
  });
}
