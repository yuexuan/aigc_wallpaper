import 'package:json_annotation/json_annotation.dart';

import 'product_info_model.dart';

part 'product_page_model.g.dart';

@JsonSerializable()
class ProductPageModel extends Object {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  ProductPageData data;

  ProductPageModel(
    this.code,
    this.msg,
    this.data,
  );

  factory ProductPageModel.fromJson(Map<String, dynamic> srcJson) =>
      _$ProductPageModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProductPageModelToJson(this);
}

@JsonSerializable()
class ProductPageData extends Object {
  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'list')
  List<Product> list;

  ProductPageData(
    this.total,
    this.list,
  );

  factory ProductPageData.fromJson(Map<String, dynamic> srcJson) =>
      _$ProductPageDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProductPageDataToJson(this);
}

@JsonSerializable()
class Product extends Object {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'product_name')
  String productName;

  @JsonKey(name: 'product_info')
  ProductInfo productInfo;

  @JsonKey(name: 'product_prompt')
  String productPrompt;

  @JsonKey(name: 'negative_product_prompt')
  String negativeProductPrompt;

  @JsonKey(name: 'product_categry_idx')
  int productCategryIdx;

  @JsonKey(name: 'product_tags')
  List<String> productTags;

  @JsonKey(name: 'product_short_desc')
  String productShortDesc;

  @JsonKey(name: 'product_detail')
  String productDetail;

  @JsonKey(name: 'views')
  int views;

  @JsonKey(name: 'likes')
  int likes;

  @JsonKey(name: 'isTrending')
  bool isTrending;

  @JsonKey(name: 'isFavorite')
  bool isFavorite;

  @JsonKey(name: 'isLike')
  bool isLike;

  Product(
    this.id,
    this.productName,
    this.productInfo,
    this.productPrompt,
    this.negativeProductPrompt,
    this.productCategryIdx,
    this.productTags,
    this.productShortDesc,
    this.productDetail,
    this.views,
    this.likes,
    this.isTrending,
    this.isFavorite,
    this.isLike,
  );

  factory Product.fromJson(Map<String, dynamic> srcJson) =>
      _$ProductFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
