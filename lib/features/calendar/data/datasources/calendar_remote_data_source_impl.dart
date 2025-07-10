import 'dart:convert';

import 'package:sworks_mobile/features/calendar/data/datasources/calendar_remote_data_source.dart';
import 'package:sworks_mobile/features/calendar/data/models/calendar_response_model.dart';
import 'package:sworks_mobile/network/api_error.dart';
import 'package:sworks_mobile/network/base_response.dart';
import 'package:sworks_mobile/network/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

/// 캘린더 원격 데이터 소스 구현체
class CalendarRemoteDataSourceImpl implements CalendarRemoteDataSource {
  final DioClient _dioClient;

  CalendarRemoteDataSourceImpl(this._dioClient);

  @override
  Future<BaseResponse<List<CalendarResponseModel>>> getEvents() async {
    try {
      // final response = await _dioClient.get('/events');
      final jsonString = await rootBundle.loadString(
        'assets/json/calendar_example.json',
      );

      final response = jsonDecode(jsonString);
      final Map<String, dynamic> responseData =
          response as Map<String, dynamic>;

      return BaseResponse.fromJson(
        responseData,
        (json) => (json as List)
            .map(
              (item) =>
                  CalendarResponseModel.fromJson(item as Map<String, dynamic>),
            )
            .toList(),
      );
    } on DioException catch (e) {
      return ApiError.handleDioException<List<CalendarResponseModel>>(
        e,
        (json) => (json as List)
            .map(
              (item) =>
                  CalendarResponseModel.fromJson(item as Map<String, dynamic>),
            )
            .toList(),
        [],
      );
    } catch (e) {
      return ApiError.handleGeneralException<List<CalendarResponseModel>>(
        e,
        [],
      );
    }
  }

  @override
  Future<BaseResponse<List<CalendarResponseModel>>> getEventsByDateRange(
    DateTime start,
    DateTime end,
  ) async {
    try {
      final response = await _dioClient.get(
        '/events/range',
        queryParameters: {
          'start': start.toIso8601String(),
          'end': end.toIso8601String(),
        },
      );
      final Map<String, dynamic> responseData =
          response.data as Map<String, dynamic>;

      return BaseResponse.fromJson(
        responseData,
        (json) => (json as List)
            .map(
              (item) =>
                  CalendarResponseModel.fromJson(item as Map<String, dynamic>),
            )
            .toList(),
      );
    } on DioException catch (e) {
      return ApiError.handleDioException<List<CalendarResponseModel>>(
        e,
        (json) => (json as List)
            .map(
              (item) =>
                  CalendarResponseModel.fromJson(item as Map<String, dynamic>),
            )
            .toList(),
        [],
      );
    } catch (e) {
      return ApiError.handleGeneralException<List<CalendarResponseModel>>(
        e,
        [],
      );
    }
  }
}
