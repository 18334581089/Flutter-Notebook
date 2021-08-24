// ignore: import_of_legacy_library_into_null_safe
import 'package:githubappflutter/redux/state.dart';
import 'package:json_annotation/json_annotation.dart';
part './ModelDemo.g.dart';

@JsonSerializable()
// class ModelDemo extends Object with _$ModelDemoSerializerMixin {
class ModelDemo extends User {
  String? name;

  int? id;

  // @JsonKey(name: "push_id")
  int? pushId;

  ModelDemo(this.name, this.id, this.pushId);

  factory ModelDemo.fromJson(Map<String, dynamic> json) =>
      _$ModelDemoFromJson(json);

  // 命名构造函数
  ModelDemo.test({name: 'name'});
}
