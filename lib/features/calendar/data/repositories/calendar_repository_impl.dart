import 'package:sworks_mobile/features/calendar/data/datasources/calendar_remote_data_source.dart';
import 'package:sworks_mobile/features/calendar/data/models/calendar_response_model.dart';
import 'package:sworks_mobile/features/calendar/domain/entities/calendar_event_entity.dart';
import 'package:sworks_mobile/features/calendar/domain/repositories/calendar_repository.dart';
import 'package:sworks_mobile/network/base_response.dart';

/// 캘린더 리포지토리 구현체
class CalendarRepositoryImpl implements CalendarRepository {
  final CalendarRemoteDataSource _remoteDataSource;

  CalendarRepositoryImpl(this._remoteDataSource);

  @override
  Future<BaseResponse<List<CalendarEventEntity>>> getEvents() async {
    final response = await _remoteDataSource.getEvents();

    return BaseResponse<List<CalendarEventEntity>>(
      code: response.code,
      message: response.message,
      data: response.data.map((model) => model.toEntity()).toList(),
    );
  }

  @override
  Future<BaseResponse<List<CalendarEventEntity>>> getEventsByDateRange(
    DateTime start,
    DateTime end,
  ) async {
    // RemoteDataSource에서 ResponseModel을 가져옴
    final response = await _remoteDataSource.getEventsByDateRange(start, end);

    return BaseResponse<List<CalendarEventEntity>>(
      code: response.code,
      message: response.message,
      data: response.data
          .map(
            (model) => CalendarEventEntity(
              scheduleId: model.scheduleId,
              title: model.title,
              description: model.description,
              siteId: model.siteId,
              clientId: model.clientId,
              codeId: model.codeId,
              isAllDay: model.isAllDay,
              startDate: model.startDate,
              endDate: model.endDate,
              viewColor: model.viewColor,
              alarmYn: model.alarmYn,
            ),
          )
          .toList(),
    );
  }
}
