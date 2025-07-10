// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_permission_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPermissionResponseModelImpl _$$UserPermissionResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$UserPermissionResponseModelImpl(
  userPermission: UserPermission.fromJson(
    json['userPermission'] as Map<String, dynamic>,
  ),
  placePermission: PlacePermission.fromJson(
    json['placePermission'] as Map<String, dynamic>,
  ),
  workInfos: (json['workInfos'] as List<dynamic>)
      .map((e) => WorkInfos.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$UserPermissionResponseModelImplToJson(
  _$UserPermissionResponseModelImpl instance,
) => <String, dynamic>{
  'userPermission': instance.userPermission,
  'placePermission': instance.placePermission,
  'workInfos': instance.workInfos,
};

_$UserPermissionImpl _$$UserPermissionImplFromJson(Map<String, dynamic> json) =>
    _$UserPermissionImpl(
      userPermBasic: (json['userPermBasic'] as num).toInt(),
      userPermMachine: (json['userPermMachine'] as num).toInt(),
      userPermElec: (json['userPermElec'] as num).toInt(),
      userPermLift: (json['userPermLift'] as num).toInt(),
      userPermFire: (json['userPermFire'] as num).toInt(),
      userPermConstruct: (json['userPermConstruct'] as num).toInt(),
      userPermNetwork: (json['userPermNetwork'] as num).toInt(),
      userPermBeauty: (json['userPermBeauty'] as num).toInt(),
      userPermSecurity: (json['userPermSecurity'] as num).toInt(),
      userPermMaterial: (json['userPermMaterial'] as num).toInt(),
      userPermUser: (json['userPermUser'] as num).toInt(),
      userPermVoc: (json['userPermVoc'] as num).toInt(),
      vocMachine: json['vocMachine'] as bool,
      vocElec: json['vocElec'] as bool,
      vocLift: json['vocLift'] as bool,
      vocFire: json['vocFire'] as bool,
      vocConstruct: json['vocConstruct'] as bool,
      vocNetwork: json['vocNetwork'] as bool,
      vocBeauty: json['vocBeauty'] as bool,
      vocSecurity: json['vocSecurity'] as bool,
      vocEtc: json['vocEtc'] as bool,
      alarmYn: json['alarmYn'] as bool,
    );

Map<String, dynamic> _$$UserPermissionImplToJson(
  _$UserPermissionImpl instance,
) => <String, dynamic>{
  'userPermBasic': instance.userPermBasic,
  'userPermMachine': instance.userPermMachine,
  'userPermElec': instance.userPermElec,
  'userPermLift': instance.userPermLift,
  'userPermFire': instance.userPermFire,
  'userPermConstruct': instance.userPermConstruct,
  'userPermNetwork': instance.userPermNetwork,
  'userPermBeauty': instance.userPermBeauty,
  'userPermSecurity': instance.userPermSecurity,
  'userPermMaterial': instance.userPermMaterial,
  'userPermUser': instance.userPermUser,
  'userPermVoc': instance.userPermVoc,
  'vocMachine': instance.vocMachine,
  'vocElec': instance.vocElec,
  'vocLift': instance.vocLift,
  'vocFire': instance.vocFire,
  'vocConstruct': instance.vocConstruct,
  'vocNetwork': instance.vocNetwork,
  'vocBeauty': instance.vocBeauty,
  'vocSecurity': instance.vocSecurity,
  'vocEtc': instance.vocEtc,
  'alarmYn': instance.alarmYn,
};

_$PlacePermissionImpl _$$PlacePermissionImplFromJson(
  Map<String, dynamic> json,
) => _$PlacePermissionImpl(
  locationId: (json['locationId'] as num).toInt(),
  locationPermMachine: json['locationPermMachine'] as bool,
  locationPermElec: json['locationPermElec'] as bool,
  locationPermLift: json['locationPermLift'] as bool,
  locationPermFire: json['locationPermFire'] as bool,
  locationPermConstruct: json['locationPermConstruct'] as bool,
  locationPermNetwork: json['locationPermNetwork'] as bool,
  locationPermBeauty: json['locationPermBeauty'] as bool,
  locationPermSecurity: json['locationPermSecurity'] as bool,
  locationPermMaterial: json['locationPermMaterial'] as bool,
  locationPermVoc: json['locationPermVoc'] as bool,
);

Map<String, dynamic> _$$PlacePermissionImplToJson(
  _$PlacePermissionImpl instance,
) => <String, dynamic>{
  'locationId': instance.locationId,
  'locationPermMachine': instance.locationPermMachine,
  'locationPermElec': instance.locationPermElec,
  'locationPermLift': instance.locationPermLift,
  'locationPermFire': instance.locationPermFire,
  'locationPermConstruct': instance.locationPermConstruct,
  'locationPermNetwork': instance.locationPermNetwork,
  'locationPermBeauty': instance.locationPermBeauty,
  'locationPermSecurity': instance.locationPermSecurity,
  'locationPermMaterial': instance.locationPermMaterial,
  'locationPermVoc': instance.locationPermVoc,
};

_$WorkInfosImpl _$$WorkInfosImplFromJson(Map<String, dynamic> json) =>
    _$WorkInfosImpl(
      workId: json['workId'] as String,
      workName: json['workName'] as String,
    );

Map<String, dynamic> _$$WorkInfosImplToJson(_$WorkInfosImpl instance) =>
    <String, dynamic>{'workId': instance.workId, 'workName': instance.workName};
