// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ModelDemo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelDemo _$ModelDemoFromJson(Map<String, dynamic> json) {
  return ModelDemo(
    json['name'] as String,
    json['id'] as int,
    json['push_id'] as int,
  );
}

Map<String, dynamic> _$ModelDemoToJson(ModelDemo instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'push_id': instance.pushId,
    };
