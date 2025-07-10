import 'package:sworks_mobile/features/calendar/domain/entities/calendar_event_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_response_model.freezed.dart';
part 'calendar_response_model.g.dart';

/// 캘린더 이벤트 모델
///
/// API와의 통신에 사용되는 데이터 모델입니다.
@freezed
class CalendarResponseModel with _$CalendarResponseModel {
  const CalendarResponseModel._();

  const factory CalendarResponseModel({
    required String scheduleId,
    required String title,
    required String description,
    required int siteId,
    required int clientId,
    required int codeId,
    required bool isAllDay,
    required DateTime startDate,
    required DateTime endDate,
    required String viewColor,
    required bool alarmYn,
  }) = _CalendarResponseModel;

  /// JSON에서 모델 객체로 변환
  factory CalendarResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CalendarResponseModelFromJson(json);

  static List<CalendarResponseModel> emptyList() {
    return [
      CalendarResponseModel(
        scheduleId: '',
        title: '',
        description: '',
        siteId: 0,
        clientId: 0,
        codeId: 0,
        isAllDay: false,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        viewColor: '',
        alarmYn: false,
      ),
    ];
  }
}

extension CalendarResponseModelExtension on CalendarResponseModel {
  // toEntity
  CalendarEventEntity toEntity() {
    return CalendarEventEntity(
      scheduleId: scheduleId,
      title: title,
      description: description,
      siteId: siteId,
      clientId: clientId,
      codeId: codeId,
      isAllDay: isAllDay,
      startDate: startDate,
      endDate: endDate,
      viewColor: viewColor,
      alarmYn: alarmYn,
    );
  }
}
