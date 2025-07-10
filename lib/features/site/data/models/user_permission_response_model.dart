import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_permission_response_model.freezed.dart';
part 'user_permission_response_model.g.dart';

@freezed
class UserPermissionResponseModel with _$UserPermissionResponseModel {
  const factory UserPermissionResponseModel({
    required UserPermission userPermission,
    required PlacePermission placePermission,
    required List<WorkInfos> workInfos,
  }) = _UserPermissionResponseModel;

  factory UserPermissionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserPermissionResponseModelFromJson(json);

  factory UserPermissionResponseModel.empty() {
    return UserPermissionResponseModel(
      userPermission: UserPermission(
        userPermBasic: 0,
        userPermMachine: 0,
        userPermElec: 0,
        userPermLift: 0,
        userPermFire: 0,
        userPermConstruct: 0,
        userPermNetwork: 0,
        userPermBeauty: 0,
        userPermSecurity: 0,
        userPermMaterial: 0,
        userPermUser: 0,
        userPermVoc: 0,
        vocMachine: false,
        vocElec: false,
        vocLift: false,
        vocFire: false,
        vocConstruct: false,
        vocNetwork: false,
        vocBeauty: false,
        vocSecurity: false,
        vocEtc: false,
        alarmYn: false,
      ),
      placePermission: PlacePermission(
        locationId: 0,
        locationPermMachine: false,
        locationPermElec: false,
        locationPermLift: false,
        locationPermFire: false,
        locationPermConstruct: false,
        locationPermNetwork: false,
        locationPermBeauty: false,
        locationPermSecurity: false,
        locationPermMaterial: false,
        locationPermVoc: false,
      ),

      /// 내부 형태는 Map<String,String> 이 형태로?
      ///
      workInfos: [],
    );
  }
}

@freezed
class UserPermission with _$UserPermission {
  const factory UserPermission({
    required int userPermBasic,
    required int userPermMachine,
    required int userPermElec,
    required int userPermLift,
    required int userPermFire,
    required int userPermConstruct,
    required int userPermNetwork,
    required int userPermBeauty,
    required int userPermSecurity,
    required int userPermMaterial,
    required int userPermUser,
    required int userPermVoc,
    required bool vocMachine,
    required bool vocElec,
    required bool vocLift,
    required bool vocFire,
    required bool vocConstruct,
    required bool vocNetwork,
    required bool vocBeauty,
    required bool vocSecurity,
    required bool vocEtc,
    required bool alarmYn,
  }) = _UserPermission;

  factory UserPermission.fromJson(Map<String, dynamic> json) =>
      _$UserPermissionFromJson(json);
}

@freezed
class PlacePermission with _$PlacePermission {
  const factory PlacePermission({
    required int locationId,
    required bool locationPermMachine,
    required bool locationPermElec,
    required bool locationPermLift,
    required bool locationPermFire,
    required bool locationPermConstruct,
    required bool locationPermNetwork,
    required bool locationPermBeauty,
    required bool locationPermSecurity,
    required bool locationPermMaterial,
    required bool locationPermVoc,
  }) = _PlacePermission;

  factory PlacePermission.fromJson(Map<String, dynamic> json) =>
      _$PlacePermissionFromJson(json);
}

@freezed
class WorkInfos with _$WorkInfos {
  /// WorkInfos 클래스는 사용자 권한 정보의 workInfos 필드에 사용되는 모델입니다.
  /// API 응답의 내부 형태에 맞게 key를 String 타입으로 정의합니다.
  const factory WorkInfos({required String workId, required String workName}) =
      _WorkInfos;

  factory WorkInfos.fromJson(Map<String, dynamic> json) =>
      _$WorkInfosFromJson(json);
}
