import 'package:json_annotation/json_annotation.dart';

part 'product_info_model.g.dart';

@JsonSerializable()
class ProductInfo extends Object {
  @JsonKey(name: 'product_original_url')
  String productOriginalUrl;

  ProductInfo(
    this.productOriginalUrl,
  );

  factory ProductInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$ProductInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProductInfoToJson(this);
}
