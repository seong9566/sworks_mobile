// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalendarResponseModelImpl _$$CalendarResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$CalendarResponseModelImpl(
  scheduleId: json['scheduleId'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  siteId: (json['siteId'] as num).toInt(),
  clientId: (json['clientId'] as num).toInt(),
  codeId: (json['codeId'] as num).toInt(),
  isAllDay: json['isAllDay'] as bool,
  startDate: DateTime.parse(json['startDate'] as String),
  endDate: DateTime.parse(json['endDate'] as String),
  viewColor: json['viewColor'] as String,
  alarmYn: json['alarmYn'] as bool,
);

Map<String, dynamic> _$$CalendarResponseModelImplToJson(
  _$CalendarResponseModelImpl instance,
) => <String, dynamic>{
  'scheduleId': instance.scheduleId,
  'title': instance.title,
  'description': instance.description,
  'siteId': instance.siteId,
  'clientId': instance.clientId,
  'codeId': instance.codeId,
  'isAllDay': instance.isAllDay,
  'startDate': instance.startDate.toIso8601String(),
  'endDate': instance.endDate.toIso8601String(),
  'viewColor': instance.viewColor,
  'alarmYn': instance.alarmYn,
};
