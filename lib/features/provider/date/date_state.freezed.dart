// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'date_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DateState {
  DateTime get selectedDate => throw _privateConstructorUsedError;
  DateTime get now => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;

  /// Create a copy of DateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DateStateCopyWith<DateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateStateCopyWith<$Res> {
  factory $DateStateCopyWith(DateState value, $Res Function(DateState) then) =
      _$DateStateCopyWithImpl<$Res, DateState>;
  @useResult
  $Res call({
    DateTime selectedDate,
    DateTime now,
    DateTime startDate,
    DateTime endDate,
  });
}

/// @nodoc
class _$DateStateCopyWithImpl<$Res, $Val extends DateState>
    implements $DateStateCopyWith<$Res> {
  _$DateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDate = null,
    Object? now = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(
      _value.copyWith(
            selectedDate: null == selectedDate
                ? _value.selectedDate
                : selectedDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            now: null == now
                ? _value.now
                : now // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endDate: null == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DateStateImplCopyWith<$Res>
    implements $DateStateCopyWith<$Res> {
  factory _$$DateStateImplCopyWith(
    _$DateStateImpl value,
    $Res Function(_$DateStateImpl) then,
  ) = __$$DateStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DateTime selectedDate,
    DateTime now,
    DateTime startDate,
    DateTime endDate,
  });
}

/// @nodoc
class __$$DateStateImplCopyWithImpl<$Res>
    extends _$DateStateCopyWithImpl<$Res, _$DateStateImpl>
    implements _$$DateStateImplCopyWith<$Res> {
  __$$DateStateImplCopyWithImpl(
    _$DateStateImpl _value,
    $Res Function(_$DateStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDate = null,
    Object? now = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(
      _$DateStateImpl(
        selectedDate: null == selectedDate
            ? _value.selectedDate
            : selectedDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        now: null == now
            ? _value.now
            : now // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endDate: null == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$DateStateImpl implements _DateState {
  const _$DateStateImpl({
    required this.selectedDate,
    required this.now,
    required this.startDate,
    required this.endDate,
  });

  @override
  final DateTime selectedDate;
  @override
  final DateTime now;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;

  @override
  String toString() {
    return 'DateState(selectedDate: $selectedDate, now: $now, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DateStateImpl &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.now, now) || other.now == now) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedDate, now, startDate, endDate);

  /// Create a copy of DateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DateStateImplCopyWith<_$DateStateImpl> get copyWith =>
      __$$DateStateImplCopyWithImpl<_$DateStateImpl>(this, _$identity);
}

abstract class _DateState implements DateState {
  const factory _DateState({
    required final DateTime selectedDate,
    required final DateTime now,
    required final DateTime startDate,
    required final DateTime endDate,
  }) = _$DateStateImpl;

  @override
  DateTime get selectedDate;
  @override
  DateTime get now;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;

  /// Create a copy of DateState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DateStateImplCopyWith<_$DateStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
