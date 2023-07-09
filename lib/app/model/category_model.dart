import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends Object {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  List<Category> data;

  CategoryModel(
    this.code,
    this.msg,
    this.data,
  );

  factory CategoryModel.fromJson(Map<String, dynamic> srcJson) =>
      _$CategoryModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

@JsonSerializable()
class Category extends Object {
  @JsonKey(name: 'cate_idx')
  int cateIdx;

  @JsonKey(name: 'cate_order')
  int cateOrder;

  @JsonKey(name: 'name')
  String name;

  Category(
    this.cateIdx,
    this.cateOrder,
    this.name,
  );

  factory Category.fromJson(Map<String, dynamic> srcJson) =>
      _$CategoryFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
