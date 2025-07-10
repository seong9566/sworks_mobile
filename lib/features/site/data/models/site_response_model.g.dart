// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SiteResponseModelImpl _$$SiteResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$SiteResponseModelImpl(
  siteSeq: (json['siteSeq'] as num).toInt(),
  siteName: json['siteName'] as String,
);

Map<String, dynamic> _$$SiteResponseModelImplToJson(
  _$SiteResponseModelImpl instance,
) => <String, dynamic>{
  'siteSeq': instance.siteSeq,
  'siteName': instance.siteName,
};
