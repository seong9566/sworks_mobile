import 'package:sworks_mobile/features/calendar/domain/entities/calendar_event_entity.dart';
import 'package:sworks_mobile/features/calendar/domain/repositories/calendar_repository.dart';
import 'package:logger/logger.dart';

/// 특정 기간 내의 캘린더 이벤트를 가져오는 유스케이스
class GetEventsByDateRangeUseCase {
  final CalendarRepository _repository;

  GetEventsByDateRangeUseCase(this._repository);

  /// 특정 기간 내의 캘린더 이벤트를 가져옵니다.
  /// BaseResponse에서 데이터를 추출하거나 예외를 처리합니다.
  Future<List<CalendarEventEntity>> execute(
    DateTime start,
    DateTime end,
  ) async {
    final response = await _repository.getEventsByDateRange(start, end);

    // 성공적으로 데이터를 가져왔을 경우
    if (response.code == 200) {
      return response.data;
    }
    // 오류가 발생한 경우
    else {
      throw Exception('특정 기간 이벤트 조회 중 오류가 발생했습니다: ${response.message}');
    }
  }

  /// 서버 데이터에서 event의 StartDate ~ EndDate까지 모든 날짜에 이벤트를 매핑
  /// TableCalendar와 호환되도록 UTC로 변환하여 저장합니다.
  Future<Map<DateTime, List<CalendarEventEntity>>> mapEventsByDate(
    List<CalendarEventEntity> events,
  ) async {
    final Map<DateTime, List<CalendarEventEntity>> eventsByDate = {};

    for (final event in events) {
      DateTime currentDate = DateTime.utc(
        event.startDate.year,
        event.startDate.month,
        event.startDate.day,
      );

      final endDate = DateTime.utc(
        event.endDate.year,
        event.endDate.month,
        event.endDate.day,
      );

      // endDate까지 (포함) 반복
      while (!currentDate.isAfter(endDate)) {
        // 날짜별 이벤트 목록 가져오기 (없으면 빈 리스트 생성)
        final dateEvents = eventsByDate[currentDate] ?? [];
        dateEvents.add(event);
        eventsByDate[currentDate] = dateEvents;

        // 다음 날짜로 이동 (UTC 유지)
        currentDate = DateTime.utc(
          currentDate.year,
          currentDate.month,
          currentDate.day + 1,
        );
      }
    }
    return eventsByDate;
  }
}
