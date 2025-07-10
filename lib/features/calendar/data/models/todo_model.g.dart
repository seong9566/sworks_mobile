// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoModelImpl _$$TodoModelImplFromJson(Map<String, dynamic> json) =>
    _$TodoModelImpl(
      title: json['title'] as String,
      isChecked: json['isChecked'] as bool,
      shareUserName: json['shareUserName'] as String,
      createUserName: json['createUserName'] as String,
      todoDetailModel: (json['todoDetailModel'] as List<dynamic>)
          .map((e) => TodoDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TodoModelImplToJson(_$TodoModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'isChecked': instance.isChecked,
      'shareUserName': instance.shareUserName,
      'createUserName': instance.createUserName,
      'todoDetailModel': instance.todoDetailModel,
    };

_$TodoDetailModelImpl _$$TodoDetailModelImplFromJson(
  Map<String, dynamic> json,
) => _$TodoDetailModelImpl(
  detailTitle: json['detailTitle'] as String,
  isChecked: json['isChecked'] as bool,
);

Map<String, dynamic> _$$TodoDetailModelImplToJson(
  _$TodoDetailModelImpl instance,
) => <String, dynamic>{
  'detailTitle': instance.detailTitle,
  'isChecked': instance.isChecked,
};
