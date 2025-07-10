import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_model.g.dart';
part 'todo_model.freezed.dart';

@freezed
class TodoModel with _$TodoModel {
  const factory TodoModel({
    required String title,
    required bool isChecked,
    required String shareUserName,
    required String createUserName,
    required List<TodoDetailModel> todoDetailModel,
  }) = _TodoModel;

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);
}

@freezed
class TodoDetailModel with _$TodoDetailModel {
  const factory TodoDetailModel({
    required String detailTitle,
    required bool isChecked,
  }) = _TodoDetailModel;

  factory TodoDetailModel.fromJson(Map<String, dynamic> json) =>
      _$TodoDetailModelFromJson(json);
}
