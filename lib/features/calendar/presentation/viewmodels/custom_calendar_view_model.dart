import 'package:sworks_mobile/features/calendar/data/models/todo_model.dart';
import 'package:sworks_mobile/features/calendar/domain/entities/calendar_event_entity.dart';
import 'package:sworks_mobile/features/calendar/domain/usecases/get_events_by_date_range_usecase.dart';
import 'package:sworks_mobile/features/calendar/domain/usecases/get_events_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 캘린더 상태
class CustomCalendarState {
  final bool isLoading;
  final List<CalendarEventEntity> events;
  final String? errorMessage;
  final List<TodoModel> todoList;
  final DateTime? selectedDate;

  const CustomCalendarState({
    this.isLoading = false,
    this.events = const [],
    this.errorMessage,
    this.todoList = const [],
    this.selectedDate,
  });

  /// 로딩 상태로 변경
  CustomCalendarState copyWithLoading() {
    return CustomCalendarState(
      isLoading: true,
      events: events,
      errorMessage: null,
      todoList: todoList,
      selectedDate: selectedDate,
    );
  }

  /// 데이터 로드 성공
  CustomCalendarState copyWithSuccess(List<CalendarEventEntity> events) {
    return CustomCalendarState(
      isLoading: false,
      events: events,
      errorMessage: null,
      todoList: todoList,
      selectedDate: selectedDate,
    );
  }

  /// 에러 상태로 변경
  CustomCalendarState copyWithError(String message) {
    return CustomCalendarState(
      isLoading: false,
      events: events,
      errorMessage: message,
      todoList: todoList,
      selectedDate: selectedDate,
    );
  }

  /// 일반 상태 업데이트
  CustomCalendarState copyWith({
    bool? isLoading,
    List<CalendarEventEntity>? events,
    String? errorMessage,
    List<TodoModel>? todoList,
    DateTime? selectedDate,
    bool clearError = false,
  }) {
    return CustomCalendarState(
      isLoading: isLoading ?? this.isLoading,
      events: events ?? this.events,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      todoList: todoList ?? this.todoList,
      selectedDate: selectedDate ?? this.selectedDate,
    );
  }
}

/// 캘린더 뷰모델
class CustomCalendarViewModel extends StateNotifier<CustomCalendarState> {
  final GetEventsUseCase _getEventsUseCase;
  final GetEventsByDateRangeUseCase _getEventsByDateRangeUseCase;

  CustomCalendarViewModel({
    required GetEventsUseCase getEventsUseCase,
    required GetEventsByDateRangeUseCase getEventsByDateRangeUseCase,
  }) : _getEventsUseCase = getEventsUseCase,
       _getEventsByDateRangeUseCase = getEventsByDateRangeUseCase,
       super(const CustomCalendarState()) {
    // 초기 상태 설정
    initState();
  }

  /// 초기 상태 설정
  void initState() {
    // 더미 Todo 데이터로 초기화
    // state = state.copyWith(todoList: dummyTodos);
  }

  /// 모든 이벤트 로드
  Future<void> loadAllEvents() async {
    try {
      state = state.copyWithLoading();
      final events = await _getEventsUseCase.execute();
      state = state.copyWithSuccess(events);
    } catch (e) {
      state = state.copyWithError('이벤트 로드 중 오류가 발생했습니다: $e');
    }
  }

  /// 특정 기간의 이벤트 로드
  Future<void> loadEventsByDateRange(DateTime start, DateTime end) async {
    try {
      state = state.copyWithLoading();
      final events = await _getEventsByDateRangeUseCase.execute(start, end);
      state = state.copyWithSuccess(events);
    } catch (e) {
      state = state.copyWithError('특정 기간 이벤트 로드 중 오류가 발생했습니다: $e');
    }
  }

  /// 현재 월의 이벤트 로드
  Future<void> loadEventsForCurrentMonth() async {
    final now = DateTime.now();
    final firstDayOfMonth = DateTime(now.year, now.month, 1);
    final lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

    await loadEventsByDateRange(firstDayOfMonth, lastDayOfMonth);
  }

  /// 선택한 날짜의 이벤트 필터링
  // List<CalendarEventEntity> getEventsForDay(DateTime day) {
  //   return state.events.where((event) {
  //     final eventDate = DateTime(
  //       event.startTime.year,
  //       event.startTime.month,
  //       event.startTime.day,
  //     );
  //     final selectedDate = DateTime(day.year, day.month, day.day);
  //     return eventDate.isAtSameMomentAs(selectedDate);
  //   }).toList();
  // }
  //--------------- Todo 관련 메서드 ---------------//

  /// TODO 체크
  void checkTodo(int index, bool value) {
    /// 1. 변경할 TODO
    final todo = state.todoList[index];
    final List<TodoDetailModel> updatedDetails;

    /// 조건 1) 만약 TODO가 체크되어있다면 내부 하위 요소들도 모두 체크
    if (value) {
      updatedDetails = todo.todoDetailModel
          .map((detail) => detail.copyWith(isChecked: true))
          .toList();
    }
    /// 조건 2) TODO가 이미 체크 되어 있는 상태에서 다시 체크를 했다면 내부 하위 요소들 모두 해제
    else {
      updatedDetails = todo.todoDetailModel
          .map((detail) => detail.copyWith(isChecked: false))
          .toList();
    }

    /// 2. TODO 업데이트
    final updatedTodo = todo.copyWith(
      isChecked: value,
      todoDetailModel: updatedDetails,
    );

    /// 3. TODO List 업데이트
    final updatedTodoList = state.todoList
        .map((e) => e == todo ? updatedTodo : e)
        .toList();

    state = state.copyWith(todoList: updatedTodoList);
  }

  /// TODO의 Detail 체크
  void checkTodoDetail(int index, int detailIndex, bool value) {
    final todo = state.todoList[index];

    /// 1. detail 항목 체크/해제
    final updatedDetails = todo.todoDetailModel.asMap().entries.map((entry) {
      final i = entry.key;
      final detail = entry.value;
      return i == detailIndex ? detail.copyWith(isChecked: value) : detail;
    }).toList();

    // 모든 detail이 체크되었는지 확인
    final isAllDetailsChecked = updatedDetails.every(
      (d) => d.isChecked == true,
    );

    final updatedTodo = todo.copyWith(
      isChecked: isAllDetailsChecked,
      todoDetailModel: updatedDetails,
    );

    final updatedTodoList = state.todoList
        .map((e) => e == todo ? updatedTodo : e)
        .toList();

    state = state.copyWith(todoList: updatedTodoList);
  }

  /// 특정 날짜의 Todo 목록 가져오기 (향후 날짜별 필터링 기능 구현 시 사용)
  List<TodoModel> getTodosForSelectedDate() {
    // 현재는 모든 Todo를 반환하지만, 향후 날짜별 필터링 로직 추가 가능
    return state.todoList;
  }
}
