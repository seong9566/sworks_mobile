// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CalendarResponseModel _$CalendarResponseModelFromJson(
  Map<String, dynamic> json,
) {
  return _CalendarResponseModel.fromJson(json);
}

/// @nodoc
mixin _$CalendarResponseModel {
  String get scheduleId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get siteId => throw _privateConstructorUsedError;
  int get clientId => throw _privateConstructorUsedError;
  int get codeId => throw _privateConstructorUsedError;
  bool get isAllDay => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  String get viewColor => throw _privateConstructorUsedError;
  bool get alarmYn => throw _privateConstructorUsedError;

  /// Serializes this CalendarResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CalendarResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalendarResponseModelCopyWith<CalendarResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarResponseModelCopyWith<$Res> {
  factory $CalendarResponseModelCopyWith(
    CalendarResponseModel value,
    $Res Function(CalendarResponseModel) then,
  ) = _$CalendarResponseModelCopyWithImpl<$Res, CalendarResponseModel>;
  @useResult
  $Res call({
    String scheduleId,
    String title,
    String description,
    int siteId,
    int clientId,
    int codeId,
    bool isAllDay,
    DateTime startDate,
    DateTime endDate,
    String viewColor,
    bool alarmYn,
  });
}

/// @nodoc
class _$CalendarResponseModelCopyWithImpl<
  $Res,
  $Val extends CalendarResponseModel
>
    implements $CalendarResponseModelCopyWith<$Res> {
  _$CalendarResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalendarResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduleId = null,
    Object? title = null,
    Object? description = null,
    Object? siteId = null,
    Object? clientId = null,
    Object? codeId = null,
    Object? isAllDay = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? viewColor = null,
    Object? alarmYn = null,
  }) {
    return _then(
      _value.copyWith(
            scheduleId: null == scheduleId
                ? _value.scheduleId
                : scheduleId // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            siteId: null == siteId
                ? _value.siteId
                : siteId // ignore: cast_nullable_to_non_nullable
                      as int,
            clientId: null == clientId
                ? _value.clientId
                : clientId // ignore: cast_nullable_to_non_nullable
                      as int,
            codeId: null == codeId
                ? _value.codeId
                : codeId // ignore: cast_nullable_to_non_nullable
                      as int,
            isAllDay: null == isAllDay
                ? _value.isAllDay
                : isAllDay // ignore: cast_nullable_to_non_nullable
                      as bool,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endDate: null == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            viewColor: null == viewColor
                ? _value.viewColor
                : viewColor // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$CalendarResponseModelImplCopyWith<$Res>
    implements $CalendarResponseModelCopyWith<$Res> {
  factory _$$CalendarResponseModelImplCopyWith(
    _$CalendarResponseModelImpl value,
    $Res Function(_$CalendarResponseModelImpl) then,
  ) = __$$CalendarResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String scheduleId,
    String title,
    String description,
    int siteId,
    int clientId,
    int codeId,
    bool isAllDay,
    DateTime startDate,
    DateTime endDate,
    String viewColor,
    bool alarmYn,
  });
}

/// @nodoc
class __$$CalendarResponseModelImplCopyWithImpl<$Res>
    extends
        _$CalendarResponseModelCopyWithImpl<$Res, _$CalendarResponseModelImpl>
    implements _$$CalendarResponseModelImplCopyWith<$Res> {
  __$$CalendarResponseModelImplCopyWithImpl(
    _$CalendarResponseModelImpl _value,
    $Res Function(_$CalendarResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CalendarResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduleId = null,
    Object? title = null,
    Object? description = null,
    Object? siteId = null,
    Object? clientId = null,
    Object? codeId = null,
    Object? isAllDay = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? viewColor = null,
    Object? alarmYn = null,
  }) {
    return _then(
      _$CalendarResponseModelImpl(
        scheduleId: null == scheduleId
            ? _value.scheduleId
            : scheduleId // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        siteId: null == siteId
            ? _value.siteId
            : siteId // ignore: cast_nullable_to_non_nullable
                  as int,
        clientId: null == clientId
            ? _value.clientId
            : clientId // ignore: cast_nullable_to_non_nullable
                  as int,
        codeId: null == codeId
            ? _value.codeId
            : codeId // ignore: cast_nullable_to_non_nullable
                  as int,
        isAllDay: null == isAllDay
            ? _value.isAllDay
            : isAllDay // ignore: cast_nullable_to_non_nullable
                  as bool,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endDate: null == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        viewColor: null == viewColor
            ? _value.viewColor
            : viewColor // ignore: cast_nullable_to_non_nullable
                  as String,
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
class _$CalendarResponseModelImpl extends _CalendarResponseModel {
  const _$CalendarResponseModelImpl({
    required this.scheduleId,
    required this.title,
    required this.description,
    required this.siteId,
    required this.clientId,
    required this.codeId,
    required this.isAllDay,
    required this.startDate,
    required this.endDate,
    required this.viewColor,
    required this.alarmYn,
  }) : super._();

  factory _$CalendarResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalendarResponseModelImplFromJson(json);

  @override
  final String scheduleId;
  @override
  final String title;
  @override
  final String description;
  @override
  final int siteId;
  @override
  final int clientId;
  @override
  final int codeId;
  @override
  final bool isAllDay;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final String viewColor;
  @override
  final bool alarmYn;

  @override
  String toString() {
    return 'CalendarResponseModel(scheduleId: $scheduleId, title: $title, description: $description, siteId: $siteId, clientId: $clientId, codeId: $codeId, isAllDay: $isAllDay, startDate: $startDate, endDate: $endDate, viewColor: $viewColor, alarmYn: $alarmYn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarResponseModelImpl &&
            (identical(other.scheduleId, scheduleId) ||
                other.scheduleId == scheduleId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.codeId, codeId) || other.codeId == codeId) &&
            (identical(other.isAllDay, isAllDay) ||
                other.isAllDay == isAllDay) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.viewColor, viewColor) ||
                other.viewColor == viewColor) &&
            (identical(other.alarmYn, alarmYn) || other.alarmYn == alarmYn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    scheduleId,
    title,
    description,
    siteId,
    clientId,
    codeId,
    isAllDay,
    startDate,
    endDate,
    viewColor,
    alarmYn,
  );

  /// Create a copy of CalendarResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarResponseModelImplCopyWith<_$CalendarResponseModelImpl>
  get copyWith =>
      __$$CalendarResponseModelImplCopyWithImpl<_$CalendarResponseModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CalendarResponseModelImplToJson(this);
  }
}

abstract class _CalendarResponseModel extends CalendarResponseModel {
  const factory _CalendarResponseModel({
    required final String scheduleId,
    required final String title,
    required final String description,
    required final int siteId,
    required final int clientId,
    required final int codeId,
    required final bool isAllDay,
    required final DateTime startDate,
    required final DateTime endDate,
    required final String viewColor,
    required final bool alarmYn,
  }) = _$CalendarResponseModelImpl;
  const _CalendarResponseModel._() : super._();

  factory _CalendarResponseModel.fromJson(Map<String, dynamic> json) =
      _$CalendarResponseModelImpl.fromJson;

  @override
  String get scheduleId;
  @override
  String get title;
  @override
  String get description;
  @override
  int get siteId;
  @override
  int get clientId;
  @override
  int get codeId;
  @override
  bool get isAllDay;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  String get viewColor;
  @override
  bool get alarmYn;

  /// Create a copy of CalendarResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalendarResponseModelImplCopyWith<_$CalendarResponseModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
