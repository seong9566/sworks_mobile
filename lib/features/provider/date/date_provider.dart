import 'package:sworks_mobile/features/provider/date/date_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final globalDateProvider = StateNotifierProvider<GlobalDateProvider, DateState>(
  (ref) => GlobalDateProvider(),
);

class GlobalDateProvider extends StateNotifier<DateState> {
  GlobalDateProvider() : super(DateState.initial());

  // 다음 날
  void nextDate() {
    state = state.copyWith(
      selectedDate: state.selectedDate.add(const Duration(days: 1)),
    );
  }

  // 이전 날
  void prevDate() {
    state = state.copyWith(
      selectedDate: state.selectedDate.subtract(const Duration(days: 1)),
    );
  }

  // 선택 날짜
  void selectDate(DateTime date) {
    state = state.copyWith(selectedDate: date);
  }

  // 시작 날짜
  void selectStartDate(DateTime date) {
    state = state.copyWith(startDate: date);
  }

  // 종료 날짜
  void selectEndDate(DateTime date) {
    state = state.copyWith(endDate: date);
  }
}
