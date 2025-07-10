// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) {
  return _TodoModel.fromJson(json);
}

/// @nodoc
mixin _$TodoModel {
  String get title => throw _privateConstructorUsedError;
  bool get isChecked => throw _privateConstructorUsedError;
  String get shareUserName => throw _privateConstructorUsedError;
  String get createUserName => throw _privateConstructorUsedError;
  List<TodoDetailModel> get todoDetailModel =>
      throw _privateConstructorUsedError;

  /// Serializes this TodoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodoModelCopyWith<TodoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoModelCopyWith<$Res> {
  factory $TodoModelCopyWith(TodoModel value, $Res Function(TodoModel) then) =
      _$TodoModelCopyWithImpl<$Res, TodoModel>;
  @useResult
  $Res call({
    String title,
    bool isChecked,
    String shareUserName,
    String createUserName,
    List<TodoDetailModel> todoDetailModel,
  });
}

/// @nodoc
class _$TodoModelCopyWithImpl<$Res, $Val extends TodoModel>
    implements $TodoModelCopyWith<$Res> {
  _$TodoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? isChecked = null,
    Object? shareUserName = null,
    Object? createUserName = null,
    Object? todoDetailModel = null,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            isChecked: null == isChecked
                ? _value.isChecked
                : isChecked // ignore: cast_nullable_to_non_nullable
                      as bool,
            shareUserName: null == shareUserName
                ? _value.shareUserName
                : shareUserName // ignore: cast_nullable_to_non_nullable
                      as String,
            createUserName: null == createUserName
                ? _value.createUserName
                : createUserName // ignore: cast_nullable_to_non_nullable
                      as String,
            todoDetailModel: null == todoDetailModel
                ? _value.todoDetailModel
                : todoDetailModel // ignore: cast_nullable_to_non_nullable
                      as List<TodoDetailModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TodoModelImplCopyWith<$Res>
    implements $TodoModelCopyWith<$Res> {
  factory _$$TodoModelImplCopyWith(
    _$TodoModelImpl value,
    $Res Function(_$TodoModelImpl) then,
  ) = __$$TodoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    bool isChecked,
    String shareUserName,
    String createUserName,
    List<TodoDetailModel> todoDetailModel,
  });
}

/// @nodoc
class __$$TodoModelImplCopyWithImpl<$Res>
    extends _$TodoModelCopyWithImpl<$Res, _$TodoModelImpl>
    implements _$$TodoModelImplCopyWith<$Res> {
  __$$TodoModelImplCopyWithImpl(
    _$TodoModelImpl _value,
    $Res Function(_$TodoModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? isChecked = null,
    Object? shareUserName = null,
    Object? createUserName = null,
    Object? todoDetailModel = null,
  }) {
    return _then(
      _$TodoModelImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        isChecked: null == isChecked
            ? _value.isChecked
            : isChecked // ignore: cast_nullable_to_non_nullable
                  as bool,
        shareUserName: null == shareUserName
            ? _value.shareUserName
            : shareUserName // ignore: cast_nullable_to_non_nullable
                  as String,
        createUserName: null == createUserName
            ? _value.createUserName
            : createUserName // ignore: cast_nullable_to_non_nullable
                  as String,
        todoDetailModel: null == todoDetailModel
            ? _value._todoDetailModel
            : todoDetailModel // ignore: cast_nullable_to_non_nullable
                  as List<TodoDetailModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoModelImpl implements _TodoModel {
  const _$TodoModelImpl({
    required this.title,
    required this.isChecked,
    required this.shareUserName,
    required this.createUserName,
    required final List<TodoDetailModel> todoDetailModel,
  }) : _todoDetailModel = todoDetailModel;

  factory _$TodoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoModelImplFromJson(json);

  @override
  final String title;
  @override
  final bool isChecked;
  @override
  final String shareUserName;
  @override
  final String createUserName;
  final List<TodoDetailModel> _todoDetailModel;
  @override
  List<TodoDetailModel> get todoDetailModel {
    if (_todoDetailModel is EqualUnmodifiableListView) return _todoDetailModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todoDetailModel);
  }

  @override
  String toString() {
    return 'TodoModel(title: $title, isChecked: $isChecked, shareUserName: $shareUserName, createUserName: $createUserName, todoDetailModel: $todoDetailModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.shareUserName, shareUserName) ||
                other.shareUserName == shareUserName) &&
            (identical(other.createUserName, createUserName) ||
                other.createUserName == createUserName) &&
            const DeepCollectionEquality().equals(
              other._todoDetailModel,
              _todoDetailModel,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    isChecked,
    shareUserName,
    createUserName,
    const DeepCollectionEquality().hash(_todoDetailModel),
  );

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoModelImplCopyWith<_$TodoModelImpl> get copyWith =>
      __$$TodoModelImplCopyWithImpl<_$TodoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoModelImplToJson(this);
  }
}

abstract class _TodoModel implements TodoModel {
  const factory _TodoModel({
    required final String title,
    required final bool isChecked,
    required final String shareUserName,
    required final String createUserName,
    required final List<TodoDetailModel> todoDetailModel,
  }) = _$TodoModelImpl;

  factory _TodoModel.fromJson(Map<String, dynamic> json) =
      _$TodoModelImpl.fromJson;

  @override
  String get title;
  @override
  bool get isChecked;
  @override
  String get shareUserName;
  @override
  String get createUserName;
  @override
  List<TodoDetailModel> get todoDetailModel;

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoModelImplCopyWith<_$TodoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TodoDetailModel _$TodoDetailModelFromJson(Map<String, dynamic> json) {
  return _TodoDetailModel.fromJson(json);
}

/// @nodoc
mixin _$TodoDetailModel {
  String get detailTitle => throw _privateConstructorUsedError;
  bool get isChecked => throw _privateConstructorUsedError;

  /// Serializes this TodoDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodoDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodoDetailModelCopyWith<TodoDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoDetailModelCopyWith<$Res> {
  factory $TodoDetailModelCopyWith(
    TodoDetailModel value,
    $Res Function(TodoDetailModel) then,
  ) = _$TodoDetailModelCopyWithImpl<$Res, TodoDetailModel>;
  @useResult
  $Res call({String detailTitle, bool isChecked});
}

/// @nodoc
class _$TodoDetailModelCopyWithImpl<$Res, $Val extends TodoDetailModel>
    implements $TodoDetailModelCopyWith<$Res> {
  _$TodoDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? detailTitle = null, Object? isChecked = null}) {
    return _then(
      _value.copyWith(
            detailTitle: null == detailTitle
                ? _value.detailTitle
                : detailTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            isChecked: null == isChecked
                ? _value.isChecked
                : isChecked // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TodoDetailModelImplCopyWith<$Res>
    implements $TodoDetailModelCopyWith<$Res> {
  factory _$$TodoDetailModelImplCopyWith(
    _$TodoDetailModelImpl value,
    $Res Function(_$TodoDetailModelImpl) then,
  ) = __$$TodoDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String detailTitle, bool isChecked});
}

/// @nodoc
class __$$TodoDetailModelImplCopyWithImpl<$Res>
    extends _$TodoDetailModelCopyWithImpl<$Res, _$TodoDetailModelImpl>
    implements _$$TodoDetailModelImplCopyWith<$Res> {
  __$$TodoDetailModelImplCopyWithImpl(
    _$TodoDetailModelImpl _value,
    $Res Function(_$TodoDetailModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? detailTitle = null, Object? isChecked = null}) {
    return _then(
      _$TodoDetailModelImpl(
        detailTitle: null == detailTitle
            ? _value.detailTitle
            : detailTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        isChecked: null == isChecked
            ? _value.isChecked
            : isChecked // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoDetailModelImpl implements _TodoDetailModel {
  const _$TodoDetailModelImpl({
    required this.detailTitle,
    required this.isChecked,
  });

  factory _$TodoDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoDetailModelImplFromJson(json);

  @override
  final String detailTitle;
  @override
  final bool isChecked;

  @override
  String toString() {
    return 'TodoDetailModel(detailTitle: $detailTitle, isChecked: $isChecked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoDetailModelImpl &&
            (identical(other.detailTitle, detailTitle) ||
                other.detailTitle == detailTitle) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, detailTitle, isChecked);

  /// Create a copy of TodoDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoDetailModelImplCopyWith<_$TodoDetailModelImpl> get copyWith =>
      __$$TodoDetailModelImplCopyWithImpl<_$TodoDetailModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoDetailModelImplToJson(this);
  }
}

abstract class _TodoDetailModel implements TodoDetailModel {
  const factory _TodoDetailModel({
    required final String detailTitle,
    required final bool isChecked,
  }) = _$TodoDetailModelImpl;

  factory _TodoDetailModel.fromJson(Map<String, dynamic> json) =
      _$TodoDetailModelImpl.fromJson;

  @override
  String get detailTitle;
  @override
  bool get isChecked;

  /// Create a copy of TodoDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoDetailModelImplCopyWith<_$TodoDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
