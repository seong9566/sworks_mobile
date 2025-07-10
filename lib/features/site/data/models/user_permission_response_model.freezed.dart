// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_permission_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserPermissionResponseModel _$UserPermissionResponseModelFromJson(
  Map<String, dynamic> json,
) {
  return _UserPermissionResponseModel.fromJson(json);
}

/// @nodoc
mixin _$UserPermissionResponseModel {
  UserPermission get userPermission => throw _privateConstructorUsedError;
  PlacePermission get placePermission => throw _privateConstructorUsedError;
  List<WorkInfos> get workInfos => throw _privateConstructorUsedError;

  /// Serializes this UserPermissionResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserPermissionResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserPermissionResponseModelCopyWith<UserPermissionResponseModel>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPermissionResponseModelCopyWith<$Res> {
  factory $UserPermissionResponseModelCopyWith(
    UserPermissionResponseModel value,
    $Res Function(UserPermissionResponseModel) then,
  ) =
      _$UserPermissionResponseModelCopyWithImpl<
        $Res,
        UserPermissionResponseModel
      >;
  @useResult
  $Res call({
    UserPermission userPermission,
    PlacePermission placePermission,
    List<WorkInfos> workInfos,
  });

  $UserPermissionCopyWith<$Res> get userPermission;
  $PlacePermissionCopyWith<$Res> get placePermission;
}

/// @nodoc
class _$UserPermissionResponseModelCopyWithImpl<
  $Res,
  $Val extends UserPermissionResponseModel
>
    implements $UserPermissionResponseModelCopyWith<$Res> {
  _$UserPermissionResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserPermissionResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userPermission = null,
    Object? placePermission = null,
    Object? workInfos = null,
  }) {
    return _then(
      _value.copyWith(
            userPermission: null == userPermission
                ? _value.userPermission
                : userPermission // ignore: cast_nullable_to_non_nullable
                      as UserPermission,
            placePermission: null == placePermission
                ? _value.placePermission
                : placePermission // ignore: cast_nullable_to_non_nullable
                      as PlacePermission,
            workInfos: null == workInfos
                ? _value.workInfos
                : workInfos // ignore: cast_nullable_to_non_nullable
                      as List<WorkInfos>,
          )
          as $Val,
    );
  }

  /// Create a copy of UserPermissionResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserPermissionCopyWith<$Res> get userPermission {
    return $UserPermissionCopyWith<$Res>(_value.userPermission, (value) {
      return _then(_value.copyWith(userPermission: value) as $Val);
    });
  }

  /// Create a copy of UserPermissionResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlacePermissionCopyWith<$Res> get placePermission {
    return $PlacePermissionCopyWith<$Res>(_value.placePermission, (value) {
      return _then(_value.copyWith(placePermission: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserPermissionResponseModelImplCopyWith<$Res>
    implements $UserPermissionResponseModelCopyWith<$Res> {
  factory _$$UserPermissionResponseModelImplCopyWith(
    _$UserPermissionResponseModelImpl value,
    $Res Function(_$UserPermissionResponseModelImpl) then,
  ) = __$$UserPermissionResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    UserPermission userPermission,
    PlacePermission placePermission,
    List<WorkInfos> workInfos,
  });

  @override
  $UserPermissionCopyWith<$Res> get userPermission;
  @override
  $PlacePermissionCopyWith<$Res> get placePermission;
}

/// @nodoc
class __$$UserPermissionResponseModelImplCopyWithImpl<$Res>
    extends
        _$UserPermissionResponseModelCopyWithImpl<
          $Res,
          _$UserPermissionResponseModelImpl
        >
    implements _$$UserPermissionResponseModelImplCopyWith<$Res> {
  __$$UserPermissionResponseModelImplCopyWithImpl(
    _$UserPermissionResponseModelImpl _value,
    $Res Function(_$UserPermissionResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserPermissionResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userPermission = null,
    Object? placePermission = null,
    Object? workInfos = null,
  }) {
    return _then(
      _$UserPermissionResponseModelImpl(
        userPermission: null == userPermission
            ? _value.userPermission
            : userPermission // ignore: cast_nullable_to_non_nullable
                  as UserPermission,
        placePermission: null == placePermission
            ? _value.placePermission
            : placePermission // ignore: cast_nullable_to_non_nullable
                  as PlacePermission,
        workInfos: null == workInfos
            ? _value._workInfos
            : workInfos // ignore: cast_nullable_to_non_nullable
                  as List<WorkInfos>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPermissionResponseModelImpl
    implements _UserPermissionResponseModel {
  const _$UserPermissionResponseModelImpl({
    required this.userPermission,
    required this.placePermission,
    required final List<WorkInfos> workInfos,
  }) : _workInfos = workInfos;

  factory _$UserPermissionResponseModelImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$UserPermissionResponseModelImplFromJson(json);

  @override
  final UserPermission userPermission;
  @override
  final PlacePermission placePermission;
  final List<WorkInfos> _workInfos;
  @override
  List<WorkInfos> get workInfos {
    if (_workInfos is EqualUnmodifiableListView) return _workInfos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workInfos);
  }

  @override
  String toString() {
    return 'UserPermissionResponseModel(userPermission: $userPermission, placePermission: $placePermission, workInfos: $workInfos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPermissionResponseModelImpl &&
            (identical(other.userPermission, userPermission) ||
                other.userPermission == userPermission) &&
            (identical(other.placePermission, placePermission) ||
                other.placePermission == placePermission) &&
            const DeepCollectionEquality().equals(
              other._workInfos,
              _workInfos,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    userPermission,
    placePermission,
    const DeepCollectionEquality().hash(_workInfos),
  );

  /// Create a copy of UserPermissionResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPermissionResponseModelImplCopyWith<_$UserPermissionResponseModelImpl>
  get copyWith =>
      __$$UserPermissionResponseModelImplCopyWithImpl<
        _$UserPermissionResponseModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPermissionResponseModelImplToJson(this);
  }
}

abstract class _UserPermissionResponseModel
    implements UserPermissionResponseModel {
  const factory _UserPermissionResponseModel({
    required final UserPermission userPermission,
    required final PlacePermission placePermission,
    required final List<WorkInfos> workInfos,
  }) = _$UserPermissionResponseModelImpl;

  factory _UserPermissionResponseModel.fromJson(Map<String, dynamic> json) =
      _$UserPermissionResponseModelImpl.fromJson;

  @override
  UserPermission get userPermission;
  @override
  PlacePermission get placePermission;
  @override
  List<WorkInfos> get workInfos;

  /// Create a copy of UserPermissionResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserPermissionResponseModelImplCopyWith<_$UserPermissionResponseModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

UserPermission _$UserPermissionFromJson(Map<String, dynamic> json) {
  return _UserPermission.fromJson(json);
}

/// @nodoc
mixin _$UserPermission {
  int get userPermBasic => throw _privateConstructorUsedError;
  int get userPermMachine => throw _privateConstructorUsedError;
  int get userPermElec => throw _privateConstructorUsedError;
  int get userPermLift => throw _privateConstructorUsedError;
  int get userPermFire => throw _privateConstructorUsedError;
  int get userPermConstruct => throw _privateConstructorUsedError;
  int get userPermNetwork => throw _privateConstructorUsedError;
  int get userPermBeauty => throw _privateConstructorUsedError;
  int get userPermSecurity => throw _privateConstructorUsedError;
  int get userPermMaterial => throw _privateConstructorUsedError;
  int get userPermUser => throw _privateConstructorUsedError;
  int get userPermVoc => throw _privateConstructorUsedError;
  bool get vocMachine => throw _privateConstructorUsedError;
  bool get vocElec => throw _privateConstructorUsedError;
  bool get vocLift => throw _privateConstructorUsedError;
  bool get vocFire => throw _privateConstructorUsedError;
  bool get vocConstruct => throw _privateConstructorUsedError;
  bool get vocNetwork => throw _privateConstructorUsedError;
  bool get vocBeauty => throw _privateConstructorUsedError;
  bool get vocSecurity => throw _privateConstructorUsedError;
  bool get vocEtc => throw _privateConstructorUsedError;
  bool get alarmYn => throw _privateConstructorUsedError;

  /// Serializes this UserPermission to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserPermission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserPermissionCopyWith<UserPermission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPermissionCopyWith<$Res> {
  factory $UserPermissionCopyWith(
    UserPermission value,
    $Res Function(UserPermission) then,
  ) = _$UserPermissionCopyWithImpl<$Res, UserPermission>;
  @useResult
  $Res call({
    int userPermBasic,
    int userPermMachine,
    int userPermElec,
    int userPermLift,
    int userPermFire,
    int userPermConstruct,
    int userPermNetwork,
    int userPermBeauty,
    int userPermSecurity,
    int userPermMaterial,
    int userPermUser,
    int userPermVoc,
    bool vocMachine,
    bool vocElec,
    bool vocLift,
    bool vocFire,
    bool vocConstruct,
    bool vocNetwork,
    bool vocBeauty,
    bool vocSecurity,
    bool vocEtc,
    bool alarmYn,
  });
}

/// @nodoc
class _$UserPermissionCopyWithImpl<$Res, $Val extends UserPermission>
    implements $UserPermissionCopyWith<$Res> {
  _$UserPermissionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserPermission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userPermBasic = null,
    Object? userPermMachine = null,
    Object? userPermElec = null,
    Object? userPermLift = null,
    Object? userPermFire = null,
    Object? userPermConstruct = null,
    Object? userPermNetwork = null,
    Object? userPermBeauty = null,
    Object? userPermSecurity = null,
    Object? userPermMaterial = null,
    Object? userPermUser = null,
    Object? userPermVoc = null,
    Object? vocMachine = null,
    Object? vocElec = null,
    Object? vocLift = null,
    Object? vocFire = null,
    Object? vocConstruct = null,
    Object? vocNetwork = null,
    Object? vocBeauty = null,
    Object? vocSecurity = null,
    Object? vocEtc = null,
    Object? alarmYn = null,
  }) {
    return _then(
      _value.copyWith(
            userPermBasic: null == userPermBasic
                ? _value.userPermBasic
                : userPermBasic // ignore: cast_nullable_to_non_nullable
                      as int,
            userPermMachine: null == userPermMachine
                ? _value.userPermMachine
                : userPermMachine // ignore: cast_nullable_to_non_nullable
                      as int,
            userPermElec: null == userPermElec
                ? _value.userPermElec
                : userPermElec // ignore: cast_nullable_to_non_nullable
                      as int,
            userPermLift: null == userPermLift
                ? _value.userPermLift
                : userPermLift // ignore: cast_nullable_to_non_nullable
                      as int,
            userPermFire: null == userPermFire
                ? _value.userPermFire
                : userPermFire // ignore: cast_nullable_to_non_nullable
                      as int,
            userPermConstruct: null == userPermConstruct
                ? _value.userPermConstruct
                : userPermConstruct // ignore: cast_nullable_to_non_nullable
                      as int,
            userPermNetwork: null == userPermNetwork
                ? _value.userPermNetwork
                : userPermNetwork // ignore: cast_nullable_to_non_nullable
                      as int,
            userPermBeauty: null == userPermBeauty
                ? _value.userPermBeauty
                : userPermBeauty // ignore: cast_nullable_to_non_nullable
                      as int,
            userPermSecurity: null == userPermSecurity
                ? _value.userPermSecurity
                : userPermSecurity // ignore: cast_nullable_to_non_nullable
                      as int,
            userPermMaterial: null == userPermMaterial
                ? _value.userPermMaterial
                : userPermMaterial // ignore: cast_nullable_to_non_nullable
                      as int,
            userPermUser: null == userPermUser
                ? _value.userPermUser
                : userPermUser // ignore: cast_nullable_to_non_nullable
                      as int,
            userPermVoc: null == userPermVoc
                ? _value.userPermVoc
                : userPermVoc // ignore: cast_nullable_to_non_nullable
                      as int,
            vocMachine: null == vocMachine
                ? _value.vocMachine
                : vocMachine // ignore: cast_nullable_to_non_nullable
                      as bool,
            vocElec: null == vocElec
                ? _value.vocElec
                : vocElec // ignore: cast_nullable_to_non_nullable
                      as bool,
            vocLift: null == vocLift
                ? _value.vocLift
                : vocLift // ignore: cast_nullable_to_non_nullable
                      as bool,
            vocFire: null == vocFire
                ? _value.vocFire
                : vocFire // ignore: cast_nullable_to_non_nullable
                      as bool,
            vocConstruct: null == vocConstruct
                ? _value.vocConstruct
                : vocConstruct // ignore: cast_nullable_to_non_nullable
                      as bool,
            vocNetwork: null == vocNetwork
                ? _value.vocNetwork
                : vocNetwork // ignore: cast_nullable_to_non_nullable
                      as bool,
            vocBeauty: null == vocBeauty
                ? _value.vocBeauty
                : vocBeauty // ignore: cast_nullable_to_non_nullable
                      as bool,
            vocSecurity: null == vocSecurity
                ? _value.vocSecurity
                : vocSecurity // ignore: cast_nullable_to_non_nullable
                      as bool,
            vocEtc: null == vocEtc
                ? _value.vocEtc
                : vocEtc // ignore: cast_nullable_to_non_nullable
                      as bool,
            alarmYn: null == alarmYn
                ? _value.alarmYn
                : alarmYn // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserPermissionImplCopyWith<$Res>
    implements $UserPermissionCopyWith<$Res> {
  factory _$$UserPermissionImplCopyWith(
    _$UserPermissionImpl value,
    $Res Function(_$UserPermissionImpl) then,
  ) = __$$UserPermissionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int userPermBasic,
    int userPermMachine,
    int userPermElec,
    int userPermLift,
    int userPermFire,
    int userPermConstruct,
    int userPermNetwork,
    int userPermBeauty,
    int userPermSecurity,
    int userPermMaterial,
    int userPermUser,
    int userPermVoc,
    bool vocMachine,
    bool vocElec,
    bool vocLift,
    bool vocFire,
    bool vocConstruct,
    bool vocNetwork,
    bool vocBeauty,
    bool vocSecurity,
    bool vocEtc,
    bool alarmYn,
  });
}

/// @nodoc
class __$$UserPermissionImplCopyWithImpl<$Res>
    extends _$UserPermissionCopyWithImpl<$Res, _$UserPermissionImpl>
    implements _$$UserPermissionImplCopyWith<$Res> {
  __$$UserPermissionImplCopyWithImpl(
    _$UserPermissionImpl _value,
    $Res Function(_$UserPermissionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserPermission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userPermBasic = null,
    Object? userPermMachine = null,
    Object? userPermElec = null,
    Object? userPermLift = null,
    Object? userPermFire = null,
    Object? userPermConstruct = null,
    Object? userPermNetwork = null,
    Object? userPermBeauty = null,
    Object? userPermSecurity = null,
    Object? userPermMaterial = null,
    Object? userPermUser = null,
    Object? userPermVoc = null,
    Object? vocMachine = null,
    Object? vocElec = null,
    Object? vocLift = null,
    Object? vocFire = null,
    Object? vocConstruct = null,
    Object? vocNetwork = null,
    Object? vocBeauty = null,
    Object? vocSecurity = null,
    Object? vocEtc = null,
    Object? alarmYn = null,
  }) {
    return _then(
      _$UserPermissionImpl(
        userPermBasic: null == userPermBasic
            ? _value.userPermBasic
            : userPermBasic // ignore: cast_nullable_to_non_nullable
                  as int,
        userPermMachine: null == userPermMachine
            ? _value.userPermMachine
            : userPermMachine // ignore: cast_nullable_to_non_nullable
                  as int,
        userPermElec: null == userPermElec
            ? _value.userPermElec
            : userPermElec // ignore: cast_nullable_to_non_nullable
                  as int,
        userPermLift: null == userPermLift
            ? _value.userPermLift
            : userPermLift // ignore: cast_nullable_to_non_nullable
                  as int,
        userPermFire: null == userPermFire
            ? _value.userPermFire
            : userPermFire // ignore: cast_nullable_to_non_nullable
                  as int,
        userPermConstruct: null == userPermConstruct
            ? _value.userPermConstruct
            : userPermConstruct // ignore: cast_nullable_to_non_nullable
                  as int,
        userPermNetwork: null == userPermNetwork
            ? _value.userPermNetwork
            : userPermNetwork // ignore: cast_nullable_to_non_nullable
                  as int,
        userPermBeauty: null == userPermBeauty
            ? _value.userPermBeauty
            : userPermBeauty // ignore: cast_nullable_to_non_nullable
                  as int,
        userPermSecurity: null == userPermSecurity
            ? _value.userPermSecurity
            : userPermSecurity // ignore: cast_nullable_to_non_nullable
                  as int,
        userPermMaterial: null == userPermMaterial
            ? _value.userPermMaterial
            : userPermMaterial // ignore: cast_nullable_to_non_nullable
                  as int,
        userPermUser: null == userPermUser
            ? _value.userPermUser
            : userPermUser // ignore: cast_nullable_to_non_nullable
                  as int,
        userPermVoc: null == userPermVoc
            ? _value.userPermVoc
            : userPermVoc // ignore: cast_nullable_to_non_nullable
                  as int,
        vocMachine: null == vocMachine
            ? _value.vocMachine
            : vocMachine // ignore: cast_nullable_to_non_nullable
                  as bool,
        vocElec: null == vocElec
            ? _value.vocElec
            : vocElec // ignore: cast_nullable_to_non_nullable
                  as bool,
        vocLift: null == vocLift
            ? _value.vocLift
            : vocLift // ignore: cast_nullable_to_non_nullable
                  as bool,
        vocFire: null == vocFire
            ? _value.vocFire
            : vocFire // ignore: cast_nullable_to_non_nullable
                  as bool,
        vocConstruct: null == vocConstruct
            ? _value.vocConstruct
            : vocConstruct // ignore: cast_nullable_to_non_nullable
                  as bool,
        vocNetwork: null == vocNetwork
            ? _value.vocNetwork
            : vocNetwork // ignore: cast_nullable_to_non_nullable
                  as bool,
        vocBeauty: null == vocBeauty
            ? _value.vocBeauty
            : vocBeauty // ignore: cast_nullable_to_non_nullable
                  as bool,
        vocSecurity: null == vocSecurity
            ? _value.vocSecurity
            : vocSecurity // ignore: cast_nullable_to_non_nullable
                  as bool,
        vocEtc: null == vocEtc
            ? _value.vocEtc
            : vocEtc // ignore: cast_nullable_to_non_nullable
                  as bool,
        alarmYn: null == alarmYn
            ? _value.alarmYn
            : alarmYn // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPermissionImpl implements _UserPermission {
  const _$UserPermissionImpl({
    required this.userPermBasic,
    required this.userPermMachine,
    required this.userPermElec,
    required this.userPermLift,
    required this.userPermFire,
    required this.userPermConstruct,
    required this.userPermNetwork,
    required this.userPermBeauty,
    required this.userPermSecurity,
    required this.userPermMaterial,
    required this.userPermUser,
    required this.userPermVoc,
    required this.vocMachine,
    required this.vocElec,
    required this.vocLift,
    required this.vocFire,
    required this.vocConstruct,
    required this.vocNetwork,
    required this.vocBeauty,
    required this.vocSecurity,
    required this.vocEtc,
    required this.alarmYn,
  });

  factory _$UserPermissionImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPermissionImplFromJson(json);

  @override
  final int userPermBasic;
  @override
  final int userPermMachine;
  @override
  final int userPermElec;
  @override
  final int userPermLift;
  @override
  final int userPermFire;
  @override
  final int userPermConstruct;
  @override
  final int userPermNetwork;
  @override
  final int userPermBeauty;
  @override
  final int userPermSecurity;
  @override
  final int userPermMaterial;
  @override
  final int userPermUser;
  @override
  final int userPermVoc;
  @override
  final bool vocMachine;
  @override
  final bool vocElec;
  @override
  final bool vocLift;
  @override
  final bool vocFire;
  @override
  final bool vocConstruct;
  @override
  final bool vocNetwork;
  @override
  final bool vocBeauty;
  @override
  final bool vocSecurity;
  @override
  final bool vocEtc;
  @override
  final bool alarmYn;

  @override
  String toString() {
    return 'UserPermission(userPermBasic: $userPermBasic, userPermMachine: $userPermMachine, userPermElec: $userPermElec, userPermLift: $userPermLift, userPermFire: $userPermFire, userPermConstruct: $userPermConstruct, userPermNetwork: $userPermNetwork, userPermBeauty: $userPermBeauty, userPermSecurity: $userPermSecurity, userPermMaterial: $userPermMaterial, userPermUser: $userPermUser, userPermVoc: $userPermVoc, vocMachine: $vocMachine, vocElec: $vocElec, vocLift: $vocLift, vocFire: $vocFire, vocConstruct: $vocConstruct, vocNetwork: $vocNetwork, vocBeauty: $vocBeauty, vocSecurity: $vocSecurity, vocEtc: $vocEtc, alarmYn: $alarmYn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPermissionImpl &&
            (identical(other.userPermBasic, userPermBasic) ||
                other.userPermBasic == userPermBasic) &&
            (identical(other.userPermMachine, userPermMachine) ||
                other.userPermMachine == userPermMachine) &&
            (identical(other.userPermElec, userPermElec) ||
                other.userPermElec == userPermElec) &&
            (identical(other.userPermLift, userPermLift) ||
                other.userPermLift == userPermLift) &&
            (identical(other.userPermFire, userPermFire) ||
                other.userPermFire == userPermFire) &&
            (identical(other.userPermConstruct, userPermConstruct) ||
                other.userPermConstruct == userPermConstruct) &&
            (identical(other.userPermNetwork, userPermNetwork) ||
                other.userPermNetwork == userPermNetwork) &&
            (identical(other.userPermBeauty, userPermBeauty) ||
                other.userPermBeauty == userPermBeauty) &&
            (identical(other.userPermSecurity, userPermSecurity) ||
                other.userPermSecurity == userPermSecurity) &&
            (identical(other.userPermMaterial, userPermMaterial) ||
                other.userPermMaterial == userPermMaterial) &&
            (identical(other.userPermUser, userPermUser) ||
                other.userPermUser == userPermUser) &&
            (identical(other.userPermVoc, userPermVoc) ||
                other.userPermVoc == userPermVoc) &&
            (identical(other.vocMachine, vocMachine) ||
                other.vocMachine == vocMachine) &&
            (identical(other.vocElec, vocElec) || other.vocElec == vocElec) &&
            (identical(other.vocLift, vocLift) || other.vocLift == vocLift) &&
            (identical(other.vocFire, vocFire) || other.vocFire == vocFire) &&
            (identical(other.vocConstruct, vocConstruct) ||
                other.vocConstruct == vocConstruct) &&
            (identical(other.vocNetwork, vocNetwork) ||
                other.vocNetwork == vocNetwork) &&
            (identical(other.vocBeauty, vocBeauty) ||
                other.vocBeauty == vocBeauty) &&
            (identical(other.vocSecurity, vocSecurity) ||
                other.vocSecurity == vocSecurity) &&
            (identical(other.vocEtc, vocEtc) || other.vocEtc == vocEtc) &&
            (identical(other.alarmYn, alarmYn) || other.alarmYn == alarmYn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    userPermBasic,
    userPermMachine,
    userPermElec,
    userPermLift,
    userPermFire,
    userPermConstruct,
    userPermNetwork,
    userPermBeauty,
    userPermSecurity,
    userPermMaterial,
    userPermUser,
    userPermVoc,
    vocMachine,
    vocElec,
    vocLift,
    vocFire,
    vocConstruct,
    vocNetwork,
    vocBeauty,
    vocSecurity,
    vocEtc,
    alarmYn,
  ]);

  /// Create a copy of UserPermission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPermissionImplCopyWith<_$UserPermissionImpl> get copyWith =>
      __$$UserPermissionImplCopyWithImpl<_$UserPermissionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPermissionImplToJson(this);
  }
}

abstract class _UserPermission implements UserPermission {
  const factory _UserPermission({
    required final int userPermBasic,
    required final int userPermMachine,
    required final int userPermElec,
    required final int userPermLift,
    required final int userPermFire,
    required final int userPermConstruct,
    required final int userPermNetwork,
    required final int userPermBeauty,
    required final int userPermSecurity,
    required final int userPermMaterial,
    required final int userPermUser,
    required final int userPermVoc,
    required final bool vocMachine,
    required final bool vocElec,
    required final bool vocLift,
    required final bool vocFire,
    required final bool vocConstruct,
    required final bool vocNetwork,
    required final bool vocBeauty,
    required final bool vocSecurity,
    required final bool vocEtc,
    required final bool alarmYn,
  }) = _$UserPermissionImpl;

  factory _UserPermission.fromJson(Map<String, dynamic> json) =
      _$UserPermissionImpl.fromJson;

  @override
  int get userPermBasic;
  @override
  int get userPermMachine;
  @override
  int get userPermElec;
  @override
  int get userPermLift;
  @override
  int get userPermFire;
  @override
  int get userPermConstruct;
  @override
  int get userPermNetwork;
  @override
  int get userPermBeauty;
  @override
  int get userPermSecurity;
  @override
  int get userPermMaterial;
  @override
  int get userPermUser;
  @override
  int get userPermVoc;
  @override
  bool get vocMachine;
  @override
  bool get vocElec;
  @override
  bool get vocLift;
  @override
  bool get vocFire;
  @override
  bool get vocConstruct;
  @override
  bool get vocNetwork;
  @override
  bool get vocBeauty;
  @override
  bool get vocSecurity;
  @override
  bool get vocEtc;
  @override
  bool get alarmYn;

  /// Create a copy of UserPermission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserPermissionImplCopyWith<_$UserPermissionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlacePermission _$PlacePermissionFromJson(Map<String, dynamic> json) {
  return _PlacePermission.fromJson(json);
}

/// @nodoc
mixin _$PlacePermission {
  int get locationId => throw _privateConstructorUsedError;
  bool get locationPermMachine => throw _privateConstructorUsedError;
  bool get locationPermElec => throw _privateConstructorUsedError;
  bool get locationPermLift => throw _privateConstructorUsedError;
  bool get locationPermFire => throw _privateConstructorUsedError;
  bool get locationPermConstruct => throw _privateConstructorUsedError;
  bool get locationPermNetwork => throw _privateConstructorUsedError;
  bool get locationPermBeauty => throw _privateConstructorUsedError;
  bool get locationPermSecurity => throw _privateConstructorUsedError;
  bool get locationPermMaterial => throw _privateConstructorUsedError;
  bool get locationPermVoc => throw _privateConstructorUsedError;

  /// Serializes this PlacePermission to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlacePermission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlacePermissionCopyWith<PlacePermission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacePermissionCopyWith<$Res> {
  factory $PlacePermissionCopyWith(
    PlacePermission value,
    $Res Function(PlacePermission) then,
  ) = _$PlacePermissionCopyWithImpl<$Res, PlacePermission>;
  @useResult
  $Res call({
    int locationId,
    bool locationPermMachine,
    bool locationPermElec,
    bool locationPermLift,
    bool locationPermFire,
    bool locationPermConstruct,
    bool locationPermNetwork,
    bool locationPermBeauty,
    bool locationPermSecurity,
    bool locationPermMaterial,
    bool locationPermVoc,
  });
}

/// @nodoc
class _$PlacePermissionCopyWithImpl<$Res, $Val extends PlacePermission>
    implements $PlacePermissionCopyWith<$Res> {
  _$PlacePermissionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlacePermission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationId = null,
    Object? locationPermMachine = null,
    Object? locationPermElec = null,
    Object? locationPermLift = null,
    Object? locationPermFire = null,
    Object? locationPermConstruct = null,
    Object? locationPermNetwork = null,
    Object? locationPermBeauty = null,
    Object? locationPermSecurity = null,
    Object? locationPermMaterial = null,
    Object? locationPermVoc = null,
  }) {
    return _then(
      _value.copyWith(
            locationId: null == locationId
                ? _value.locationId
                : locationId // ignore: cast_nullable_to_non_nullable
                      as int,
            locationPermMachine: null == locationPermMachine
                ? _value.locationPermMachine
                : locationPermMachine // ignore: cast_nullable_to_non_nullable
                      as bool,
            locationPermElec: null == locationPermElec
                ? _value.locationPermElec
                : locationPermElec // ignore: cast_nullable_to_non_nullable
                      as bool,
            locationPermLift: null == locationPermLift
                ? _value.locationPermLift
                : locationPermLift // ignore: cast_nullable_to_non_nullable
                      as bool,
            locationPermFire: null == locationPermFire
                ? _value.locationPermFire
                : locationPermFire // ignore: cast_nullable_to_non_nullable
                      as bool,
            locationPermConstruct: null == locationPermConstruct
                ? _value.locationPermConstruct
                : locationPermConstruct // ignore: cast_nullable_to_non_nullable
                      as bool,
            locationPermNetwork: null == locationPermNetwork
                ? _value.locationPermNetwork
                : locationPermNetwork // ignore: cast_nullable_to_non_nullable
                      as bool,
            locationPermBeauty: null == locationPermBeauty
                ? _value.locationPermBeauty
                : locationPermBeauty // ignore: cast_nullable_to_non_nullable
                      as bool,
            locationPermSecurity: null == locationPermSecurity
                ? _value.locationPermSecurity
                : locationPermSecurity // ignore: cast_nullable_to_non_nullable
                      as bool,
            locationPermMaterial: null == locationPermMaterial
                ? _value.locationPermMaterial
                : locationPermMaterial // ignore: cast_nullable_to_non_nullable
                      as bool,
            locationPermVoc: null == locationPermVoc
                ? _value.locationPermVoc
                : locationPermVoc // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlacePermissionImplCopyWith<$Res>
    implements $PlacePermissionCopyWith<$Res> {
  factory _$$PlacePermissionImplCopyWith(
    _$PlacePermissionImpl value,
    $Res Function(_$PlacePermissionImpl) then,
  ) = __$$PlacePermissionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int locationId,
    bool locationPermMachine,
    bool locationPermElec,
    bool locationPermLift,
    bool locationPermFire,
    bool locationPermConstruct,
    bool locationPermNetwork,
    bool locationPermBeauty,
    bool locationPermSecurity,
    bool locationPermMaterial,
    bool locationPermVoc,
  });
}

/// @nodoc
class __$$PlacePermissionImplCopyWithImpl<$Res>
    extends _$PlacePermissionCopyWithImpl<$Res, _$PlacePermissionImpl>
    implements _$$PlacePermissionImplCopyWith<$Res> {
  __$$PlacePermissionImplCopyWithImpl(
    _$PlacePermissionImpl _value,
    $Res Function(_$PlacePermissionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlacePermission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationId = null,
    Object? locationPermMachine = null,
    Object? locationPermElec = null,
    Object? locationPermLift = null,
    Object? locationPermFire = null,
    Object? locationPermConstruct = null,
    Object? locationPermNetwork = null,
    Object? locationPermBeauty = null,
    Object? locationPermSecurity = null,
    Object? locationPermMaterial = null,
    Object? locationPermVoc = null,
  }) {
    return _then(
      _$PlacePermissionImpl(
        locationId: null == locationId
            ? _value.locationId
            : locationId // ignore: cast_nullable_to_non_nullable
                  as int,
        locationPermMachine: null == locationPermMachine
            ? _value.locationPermMachine
            : locationPermMachine // ignore: cast_nullable_to_non_nullable
                  as bool,
        locationPermElec: null == locationPermElec
            ? _value.locationPermElec
            : locationPermElec // ignore: cast_nullable_to_non_nullable
                  as bool,
        locationPermLift: null == locationPermLift
            ? _value.locationPermLift
            : locationPermLift // ignore: cast_nullable_to_non_nullable
                  as bool,
        locationPermFire: null == locationPermFire
            ? _value.locationPermFire
            : locationPermFire // ignore: cast_nullable_to_non_nullable
                  as bool,
        locationPermConstruct: null == locationPermConstruct
            ? _value.locationPermConstruct
            : locationPermConstruct // ignore: cast_nullable_to_non_nullable
                  as bool,
        locationPermNetwork: null == locationPermNetwork
            ? _value.locationPermNetwork
            : locationPermNetwork // ignore: cast_nullable_to_non_nullable
                  as bool,
        locationPermBeauty: null == locationPermBeauty
            ? _value.locationPermBeauty
            : locationPermBeauty // ignore: cast_nullable_to_non_nullable
                  as bool,
        locationPermSecurity: null == locationPermSecurity
            ? _value.locationPermSecurity
            : locationPermSecurity // ignore: cast_nullable_to_non_nullable
                  as bool,
        locationPermMaterial: null == locationPermMaterial
            ? _value.locationPermMaterial
            : locationPermMaterial // ignore: cast_nullable_to_non_nullable
                  as bool,
        locationPermVoc: null == locationPermVoc
            ? _value.locationPermVoc
            : locationPermVoc // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlacePermissionImpl implements _PlacePermission {
  const _$PlacePermissionImpl({
    required this.locationId,
    required this.locationPermMachine,
    required this.locationPermElec,
    required this.locationPermLift,
    required this.locationPermFire,
    required this.locationPermConstruct,
    required this.locationPermNetwork,
    required this.locationPermBeauty,
    required this.locationPermSecurity,
    required this.locationPermMaterial,
    required this.locationPermVoc,
  });

  factory _$PlacePermissionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlacePermissionImplFromJson(json);

  @override
  final int locationId;
  @override
  final bool locationPermMachine;
  @override
  final bool locationPermElec;
  @override
  final bool locationPermLift;
  @override
  final bool locationPermFire;
  @override
  final bool locationPermConstruct;
  @override
  final bool locationPermNetwork;
  @override
  final bool locationPermBeauty;
  @override
  final bool locationPermSecurity;
  @override
  final bool locationPermMaterial;
  @override
  final bool locationPermVoc;

  @override
  String toString() {
    return 'PlacePermission(locationId: $locationId, locationPermMachine: $locationPermMachine, locationPermElec: $locationPermElec, locationPermLift: $locationPermLift, locationPermFire: $locationPermFire, locationPermConstruct: $locationPermConstruct, locationPermNetwork: $locationPermNetwork, locationPermBeauty: $locationPermBeauty, locationPermSecurity: $locationPermSecurity, locationPermMaterial: $locationPermMaterial, locationPermVoc: $locationPermVoc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlacePermissionImpl &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.locationPermMachine, locationPermMachine) ||
                other.locationPermMachine == locationPermMachine) &&
            (identical(other.locationPermElec, locationPermElec) ||
                other.locationPermElec == locationPermElec) &&
            (identical(other.locationPermLift, locationPermLift) ||
                other.locationPermLift == locationPermLift) &&
            (identical(other.locationPermFire, locationPermFire) ||
                other.locationPermFire == locationPermFire) &&
            (identical(other.locationPermConstruct, locationPermConstruct) ||
                other.locationPermConstruct == locationPermConstruct) &&
            (identical(other.locationPermNetwork, locationPermNetwork) ||
                other.locationPermNetwork == locationPermNetwork) &&
            (identical(other.locationPermBeauty, locationPermBeauty) ||
                other.locationPermBeauty == locationPermBeauty) &&
            (identical(other.locationPermSecurity, locationPermSecurity) ||
                other.locationPermSecurity == locationPermSecurity) &&
            (identical(other.locationPermMaterial, locationPermMaterial) ||
                other.locationPermMaterial == locationPermMaterial) &&
            (identical(other.locationPermVoc, locationPermVoc) ||
                other.locationPermVoc == locationPermVoc));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    locationId,
    locationPermMachine,
    locationPermElec,
    locationPermLift,
    locationPermFire,
    locationPermConstruct,
    locationPermNetwork,
    locationPermBeauty,
    locationPermSecurity,
    locationPermMaterial,
    locationPermVoc,
  );

  /// Create a copy of PlacePermission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlacePermissionImplCopyWith<_$PlacePermissionImpl> get copyWith =>
      __$$PlacePermissionImplCopyWithImpl<_$PlacePermissionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PlacePermissionImplToJson(this);
  }
}

abstract class _PlacePermission implements PlacePermission {
  const factory _PlacePermission({
    required final int locationId,
    required final bool locationPermMachine,
    required final bool locationPermElec,
    required final bool locationPermLift,
    required final bool locationPermFire,
    required final bool locationPermConstruct,
    required final bool locationPermNetwork,
    required final bool locationPermBeauty,
    required final bool locationPermSecurity,
    required final bool locationPermMaterial,
    required final bool locationPermVoc,
  }) = _$PlacePermissionImpl;

  factory _PlacePermission.fromJson(Map<String, dynamic> json) =
      _$PlacePermissionImpl.fromJson;

  @override
  int get locationId;
  @override
  bool get locationPermMachine;
  @override
  bool get locationPermElec;
  @override
  bool get locationPermLift;
  @override
  bool get locationPermFire;
  @override
  bool get locationPermConstruct;
  @override
  bool get locationPermNetwork;
  @override
  bool get locationPermBeauty;
  @override
  bool get locationPermSecurity;
  @override
  bool get locationPermMaterial;
  @override
  bool get locationPermVoc;

  /// Create a copy of PlacePermission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlacePermissionImplCopyWith<_$PlacePermissionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WorkInfos _$WorkInfosFromJson(Map<String, dynamic> json) {
  return _WorkInfos.fromJson(json);
}

/// @nodoc
mixin _$WorkInfos {
  String get workId => throw _privateConstructorUsedError;
  String get workName => throw _privateConstructorUsedError;

  /// Serializes this WorkInfos to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkInfos
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkInfosCopyWith<WorkInfos> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkInfosCopyWith<$Res> {
  factory $WorkInfosCopyWith(WorkInfos value, $Res Function(WorkInfos) then) =
      _$WorkInfosCopyWithImpl<$Res, WorkInfos>;
  @useResult
  $Res call({String workId, String workName});
}

/// @nodoc
class _$WorkInfosCopyWithImpl<$Res, $Val extends WorkInfos>
    implements $WorkInfosCopyWith<$Res> {
  _$WorkInfosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkInfos
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? workId = null, Object? workName = null}) {
    return _then(
      _value.copyWith(
            workId: null == workId
                ? _value.workId
                : workId // ignore: cast_nullable_to_non_nullable
                      as String,
            workName: null == workName
                ? _value.workName
                : workName // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkInfosImplCopyWith<$Res>
    implements $WorkInfosCopyWith<$Res> {
  factory _$$WorkInfosImplCopyWith(
    _$WorkInfosImpl value,
    $Res Function(_$WorkInfosImpl) then,
  ) = __$$WorkInfosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String workId, String workName});
}

/// @nodoc
class __$$WorkInfosImplCopyWithImpl<$Res>
    extends _$WorkInfosCopyWithImpl<$Res, _$WorkInfosImpl>
    implements _$$WorkInfosImplCopyWith<$Res> {
  __$$WorkInfosImplCopyWithImpl(
    _$WorkInfosImpl _value,
    $Res Function(_$WorkInfosImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkInfos
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? workId = null, Object? workName = null}) {
    return _then(
      _$WorkInfosImpl(
        workId: null == workId
            ? _value.workId
            : workId // ignore: cast_nullable_to_non_nullable
                  as String,
        workName: null == workName
            ? _value.workName
            : workName // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkInfosImpl implements _WorkInfos {
  const _$WorkInfosImpl({required this.workId, required this.workName});

  factory _$WorkInfosImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkInfosImplFromJson(json);

  @override
  final String workId;
  @override
  final String workName;

  @override
  String toString() {
    return 'WorkInfos(workId: $workId, workName: $workName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkInfosImpl &&
            (identical(other.workId, workId) || other.workId == workId) &&
            (identical(other.workName, workName) ||
                other.workName == workName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, workId, workName);

  /// Create a copy of WorkInfos
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkInfosImplCopyWith<_$WorkInfosImpl> get copyWith =>
      __$$WorkInfosImplCopyWithImpl<_$WorkInfosImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkInfosImplToJson(this);
  }
}

abstract class _WorkInfos implements WorkInfos {
  const factory _WorkInfos({
    required final String workId,
    required final String workName,
  }) = _$WorkInfosImpl;

  factory _WorkInfos.fromJson(Map<String, dynamic> json) =
      _$WorkInfosImpl.fromJson;

  @override
  String get workId;
  @override
  String get workName;

  /// Create a copy of WorkInfos
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkInfosImplCopyWith<_$WorkInfosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
