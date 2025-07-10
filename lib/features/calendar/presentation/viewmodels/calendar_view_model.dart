import 'dart:ui';

import 'package:sworks_mobile/core/theme/app_theme.dart';
import 'package:sworks_mobile/features/calendar/domain/entities/calendar_event_entity.dart';
import 'package:sworks_mobile/features/calendar/domain/usecases/get_events_by_date_range_usecase.dart';
import 'package:sworks_mobile/features/calendar/domain/usecases/get_events_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

// * [remoteModels] : 서버에서 가져온 전체 캘린더 이벤트 리스트
// * [focusDay] : 현재 선택된 날짜
// * [firstDay] : 캘린더의 첫 날짜
// * [lastDay] : 캘린더의 마지막 날짜
// * [selectedEvents] : 선택된 날짜의 이벤트 리스트
// * [currentMonthItem] : 현재 선택된 달의 이벤트 맵 (startDate부터 endDate까지 모든 날짜에 이벤트 할당)
class CalendarState {
  List<CalendarEventEntity> remoteModels;
  DateTime focusDay;
  DateTime firstDay;
  DateTime lastDay;
  List<CalendarEventEntity> selectedItems;
  Map<DateTime, List<CalendarEventEntity>> currentMonthItem;

  CalendarState({
    required this.remoteModels,
    required this.focusDay,
    required this.firstDay,
    required this.lastDay,
    required this.selectedItems,
    required this.currentMonthItem,
  });

  CalendarState copyWith({
    List<CalendarEventEntity>? remoteModels,
    DateTime? focusDay,
    DateTime? firstDay,
    DateTime? lastDay,
    List<CalendarEventEntity>? selectedItems,
    Map<DateTime, List<CalendarEventEntity>>? currentMonthItem,
  }) {
    return CalendarState(
      remoteModels: remoteModels ?? this.remoteModels,
      focusDay: focusDay ?? this.focusDay,
      firstDay: firstDay ?? this.firstDay,
      lastDay: lastDay ?? this.lastDay,
      selectedItems: selectedItems ?? this.selectedItems,
      currentMonthItem: currentMonthItem ?? this.currentMonthItem,
    );
  }

  factory CalendarState.init() {
    return CalendarState(
      remoteModels: [],
      focusDay: DateTime.now().toUtc(),
      firstDay: DateTime(DateTime.now().year, DateTime.now().month, 1).toUtc(),
      lastDay: DateTime(
        DateTime.now().year,
        DateTime.now().month + 1,
        0,
      ).toUtc(),
      selectedItems: [],
      currentMonthItem: {},
    );
  }
}

class CalendarViewModel extends StateNotifier<CalendarState> {
  CalendarViewModel({
    required this.getEventsUseCase,
    required this.getEventsByDateRangeUseCase,
  }) : super(CalendarState.init());
  final GetEventsUseCase getEventsUseCase;
  final GetEventsByDateRangeUseCase getEventsByDateRangeUseCase;

  Future<void> fetch() async {
    try {
      final remoteModels = await getEventsUseCase.execute();
      final eventsByDate = await getEventsByDateRangeUseCase.mapEventsByDate(
        remoteModels,
      );

      state = state.copyWith(
        remoteModels: remoteModels,
        currentMonthItem: eventsByDate,
      );

      selectCalendarDay(state.focusDay);
    } catch (e) {
      Logger().d(e);
    }
  }

  /// 날짜 선택
  Future<void> selectCalendarDay(DateTime selectedDay) async {
    // 선택된 날짜를 UTC로 변환 (시간 정보 제거)
    final selectedDateUTC = DateTime.utc(
      selectedDay.year,
      selectedDay.month,
      selectedDay.day,
    );
    Logger().d('선택된 날짜: $selectedDay');
    Logger().d('선택된 날짜 UTC: $selectedDateUTC');

    // 선택된 날짜의 이벤트 가져오기
    final events = getSelectedItems(selectedDateUTC);
    Logger().d('검색된 이벤트 수: ${events.length}');

    // 상태 업데이트 - focusDay를 선택한 날짜로 설정
    state = state.copyWith(focusDay: selectedDay, selectedItems: events);
  }

  Color getColorFromHex(String hexColor) {
    try {
      // '#' 문자가 있으면 제거
      final colorString = hexColor.startsWith('#')
          ? hexColor.substring(1)
          : hexColor;
      if (colorString.length != 6) {
        return primaryColor;
      }
      return Color(int.parse('FF$colorString', radix: 16));
    } catch (e) {
      Logger().e('색상 변환 오류: $e');
      return primaryColor;
    }
  }

  List<CalendarEventEntity> getSelectedItems(DateTime focusedDay) {
    // 결과를 저장할 리스트
    List<CalendarEventEntity> result = [];

    for (final mapKey in state.currentMonthItem.keys) {
      if (_isSameDay(focusedDay, mapKey)) {
        final events = state.currentMonthItem[mapKey] ?? [];
        result.addAll(events);
      }
    }
    return result;
  }

  /// 파라미터 : 선택된 날짜 , 상태관리의 날짜
  bool _isSameDay(DateTime focusedDay, DateTime stateDate) {
    return focusedDay.year == stateDate.year &&
        focusedDay.month == stateDate.month &&
        focusedDay.day == stateDate.day;
  }
}
