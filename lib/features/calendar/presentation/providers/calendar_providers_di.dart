import 'package:sworks_mobile/features/calendar/data/datasources/calendar_remote_data_source.dart';
import 'package:sworks_mobile/features/calendar/data/datasources/calendar_remote_data_source_impl.dart';
import 'package:sworks_mobile/features/calendar/data/repositories/calendar_repository_impl.dart';
import 'package:sworks_mobile/features/calendar/domain/repositories/calendar_repository.dart';
import 'package:sworks_mobile/features/calendar/domain/usecases/get_events_by_date_range_usecase.dart';
import 'package:sworks_mobile/features/calendar/domain/usecases/get_events_usecase.dart';
import 'package:sworks_mobile/features/calendar/presentation/viewmodels/calendar_view_model.dart';
import 'package:sworks_mobile/network/dio_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// DioClient 프로바이더
final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient();
});

/// 캘린더 원격 데이터 소스 프로바이더
final calendarRemoteDataSourceProvider = Provider<CalendarRemoteDataSource>((
  ref,
) {
  final dioClient = ref.watch(dioClientProvider);
  return CalendarRemoteDataSourceImpl(dioClient);
});

/// 캘린더 리포지토리 프로바이더
final calendarRepositoryProvider = Provider<CalendarRepository>((ref) {
  final remoteDataSource = ref.watch(calendarRemoteDataSourceProvider);
  return CalendarRepositoryImpl(remoteDataSource);
});

/// 모든 이벤트 조회 유스케이스 프로바이더
final getEventsUseCaseProvider = Provider<GetEventsUseCase>((ref) {
  final repository = ref.watch(calendarRepositoryProvider);
  return GetEventsUseCase(repository);
});

/// 특정 기간 이벤트 조회 유스케이스 프로바이더
final getEventsByDateRangeUseCaseProvider =
    Provider<GetEventsByDateRangeUseCase>((ref) {
      final repository = ref.watch(calendarRepositoryProvider);
      return GetEventsByDateRangeUseCase(repository);
    });

/// 캘린더 뷰모델 프로바이더
final calendarViewModelProvider =
    StateNotifierProvider<CalendarViewModel, CalendarState>((ref) {
      final getEventsUseCase = ref.watch(getEventsUseCaseProvider);
      final getEventsByDateRangeUseCase = ref.watch(
        getEventsByDateRangeUseCaseProvider,
      );

      return CalendarViewModel(
        getEventsUseCase: getEventsUseCase,
        getEventsByDateRangeUseCase: getEventsByDateRangeUseCase,
      );
    });
