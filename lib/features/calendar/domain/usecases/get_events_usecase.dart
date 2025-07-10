import 'package:sworks_mobile/features/calendar/domain/entities/calendar_event_entity.dart';
import 'package:sworks_mobile/features/calendar/domain/repositories/calendar_repository.dart';

/// 모든 캘린더 이벤트를 가져오는 유스케이스
class GetEventsUseCase {
  final CalendarRepository _repository;

  GetEventsUseCase(this._repository);

  /// 모든 캘린더 이벤트를 가져옵니다.
  /// BaseResponse에서 데이터를 추출하거나 예외를 처리합니다.
  Future<List<CalendarEventEntity>> execute() async {
    final response = await _repository.getEvents();

    // 성공적으로 데이터를 가져왔을 경우
    if (response.code == 200) {
      return response.data;
    }
    // 오류가 발생한 경우
    else {
      throw Exception('이벤트 조회 중 오류가 발생했습니다: ${response.message}');
    }
  }
}
