import 'package:freezed_annotation/freezed_annotation.dart';

part 'date_state.freezed.dart';

@freezed
class DateState with _$DateState {
  const factory DateState({
    required DateTime selectedDate,
    required DateTime now,
    required DateTime startDate,
    required DateTime endDate,
  }) = _DateState;

  factory DateState.initial() => DateState(
    selectedDate: DateTime.now(),
    now: DateTime.now(),
    startDate: DateTime.now().subtract(const Duration(days: 1)),
    endDate: DateTime.now().add(const Duration(days: 1)),
  );
}
