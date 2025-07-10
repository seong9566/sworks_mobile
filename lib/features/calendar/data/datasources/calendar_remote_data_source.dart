import 'package:sworks_mobile/features/calendar/data/models/calendar_response_model.dart';
import 'package:sworks_mobile/network/base_response.dart';

/// 캘린더 원격 데이터 소스 인터페이스
///
/// API와의 통신을 담당하는 인터페이스입니다.
abstract class CalendarRemoteDataSource {
  /// 모든 캘린더 이벤트를 가져옵니다.
  Future<BaseResponse<List<CalendarResponseModel>>> getEvents();

  /// 특정 기간 내의 캘린더 이벤트를 가져옵니다.
  Future<BaseResponse<List<CalendarResponseModel>>> getEventsByDateRange(
    DateTime start,
    DateTime end,
  );
}
