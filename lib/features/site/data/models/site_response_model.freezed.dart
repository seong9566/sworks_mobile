// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SiteResponseModel _$SiteResponseModelFromJson(Map<String, dynamic> json) {
  return _SiteResponseModel.fromJson(json);
}

/// @nodoc
mixin _$SiteResponseModel {
  int get siteSeq => throw _privateConstructorUsedError;
  String get siteName => throw _privateConstructorUsedError;

  /// Serializes this SiteResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SiteResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SiteResponseModelCopyWith<SiteResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteResponseModelCopyWith<$Res> {
  factory $SiteResponseModelCopyWith(
    SiteResponseModel value,
    $Res Function(SiteResponseModel) then,
  ) = _$SiteResponseModelCopyWithImpl<$Res, SiteResponseModel>;
  @useResult
  $Res call({int siteSeq, String siteName});
}

/// @nodoc
class _$SiteResponseModelCopyWithImpl<$Res, $Val extends SiteResponseModel>
    implements $SiteResponseModelCopyWith<$Res> {
  _$SiteResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SiteResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? siteSeq = null, Object? siteName = null}) {
    return _then(
      _value.copyWith(
            siteSeq: null == siteSeq
                ? _value.siteSeq
                : siteSeq // ignore: cast_nullable_to_non_nullable
                      as int,
            siteName: null == siteName
                ? _value.siteName
                : siteName // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SiteResponseModelImplCopyWith<$Res>
    implements $SiteResponseModelCopyWith<$Res> {
  factory _$$SiteResponseModelImplCopyWith(
    _$SiteResponseModelImpl value,
    $Res Function(_$SiteResponseModelImpl) then,
  ) = __$$SiteResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int siteSeq, String siteName});
}

/// @nodoc
class __$$SiteResponseModelImplCopyWithImpl<$Res>
    extends _$SiteResponseModelCopyWithImpl<$Res, _$SiteResponseModelImpl>
    implements _$$SiteResponseModelImplCopyWith<$Res> {
  __$$SiteResponseModelImplCopyWithImpl(
    _$SiteResponseModelImpl _value,
    $Res Function(_$SiteResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SiteResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? siteSeq = null, Object? siteName = null}) {
    return _then(
      _$SiteResponseModelImpl(
        siteSeq: null == siteSeq
            ? _value.siteSeq
            : siteSeq // ignore: cast_nullable_to_non_nullable
                  as int,
        siteName: null == siteName
            ? _value.siteName
            : siteName // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SiteResponseModelImpl implements _SiteResponseModel {
  const _$SiteResponseModelImpl({
    required this.siteSeq,
    required this.siteName,
  });

  factory _$SiteResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SiteResponseModelImplFromJson(json);

  @override
  final int siteSeq;
  @override
  final String siteName;

  @override
  String toString() {
    return 'SiteResponseModel(siteSeq: $siteSeq, siteName: $siteName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SiteResponseModelImpl &&
            (identical(other.siteSeq, siteSeq) || other.siteSeq == siteSeq) &&
            (identical(other.siteName, siteName) ||
                other.siteName == siteName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, siteSeq, siteName);

  /// Create a copy of SiteResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SiteResponseModelImplCopyWith<_$SiteResponseModelImpl> get copyWith =>
      __$$SiteResponseModelImplCopyWithImpl<_$SiteResponseModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SiteResponseModelImplToJson(this);
  }
}

abstract class _SiteResponseModel implements SiteResponseModel {
  const factory _SiteResponseModel({
    required final int siteSeq,
    required final String siteName,
  }) = _$SiteResponseModelImpl;

  factory _SiteResponseModel.fromJson(Map<String, dynamic> json) =
      _$SiteResponseModelImpl.fromJson;

  @override
  int get siteSeq;
  @override
  String get siteName;

  /// Create a copy of SiteResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SiteResponseModelImplCopyWith<_$SiteResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
