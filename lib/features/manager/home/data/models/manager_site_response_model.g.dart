// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_site_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ManagerSiteResponseModelImpl _$$ManagerSiteResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$ManagerSiteResponseModelImpl(
  siteSeq: (json['siteSeq'] as num).toInt(),
  siteName: json['siteName'] as String,
  siteTypeSeq: (json['siteTypeSeq'] as num).toInt(),
  siteTypeName: json['siteTypeName'] as String,
  siteTel: json['siteTel'] as String,
  siteAddress: json['siteAddress'] as String,
  contracts: (json['contracts'] as List<dynamic>)
      .map((e) => ContractModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$ManagerSiteResponseModelImplToJson(
  _$ManagerSiteResponseModelImpl instance,
) => <String, dynamic>{
  'siteSeq': instance.siteSeq,
  'siteName': instance.siteName,
  'siteTypeSeq': instance.siteTypeSeq,
  'siteTypeName': instance.siteTypeName,
  'siteTel': instance.siteTel,
  'siteAddress': instance.siteAddress,
  'contracts': instance.contracts,
};

_$ContractModelImpl _$$ContractModelImplFromJson(Map<String, dynamic> json) =>
    _$ContractModelImpl(
      contractSeq: (json['contractSeq'] as num).toInt(),
      serviceTypeSeq: (json['serviceTypeSeq'] as num).toInt(),
      serviceTypeName: json['serviceTypeName'] as String,
      contractAmount: (json['contractAmount'] as num?)?.toInt(),
      contractStartDt: json['contractStartDt'] as String,
      contractEndDt: json['contractEndDt'] as String,
      contractStaff: json['contractStaff'] as String,
      contractManager: json['contractManager'] as String,
      comments: json['comments'] as String?,
      status: json['status'] as bool,
    );

Map<String, dynamic> _$$ContractModelImplToJson(_$ContractModelImpl instance) =>
    <String, dynamic>{
      'contractSeq': instance.contractSeq,
      'serviceTypeSeq': instance.serviceTypeSeq,
      'serviceTypeName': instance.serviceTypeName,
      'contractAmount': instance.contractAmount,
      'contractStartDt': instance.contractStartDt,
      'contractEndDt': instance.contractEndDt,
      'contractStaff': instance.contractStaff,
      'contractManager': instance.contractManager,
      'comments': instance.comments,
      'status': instance.status,
    };
