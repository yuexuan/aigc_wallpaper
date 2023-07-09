// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductPageModel _$ProductPageModelFromJson(Map<String, dynamic> json) =>
    ProductPageModel(
      json['code'] as int,
      json['msg'] as String,
      ProductPageData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductPageModelToJson(ProductPageModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

ProductPageData _$ProductPageDataFromJson(Map<String, dynamic> json) =>
    ProductPageData(
      json['total'] as int,
      (json['list'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductPageDataToJson(ProductPageData instance) =>
    <String, dynamic>{
      'total': instance.total,
      'list': instance.list,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['id'] as String,
      json['product_name'] as String,
      ProductInfo.fromJson(json['product_info'] as Map<String, dynamic>),
      json['product_prompt'] as String,
      json['negative_product_prompt'] as String,
      json['product_categry_idx'] as int,
      (json['product_tags'] as List<dynamic>).map((e) => e as String).toList(),
      json['product_short_desc'] as String,
      json['product_detail'] as String,
      json['views'] as int,
      json['likes'] as int,
      json['isTrending'] as bool,
      json['isFavorite'] as bool,
      json['isLike'] as bool,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'product_name': instance.productName,
      'product_info': instance.productInfo,
      'product_prompt': instance.productPrompt,
      'negative_product_prompt': instance.negativeProductPrompt,
      'product_categry_idx': instance.productCategryIdx,
      'product_tags': instance.productTags,
      'product_short_desc': instance.productShortDesc,
      'product_detail': instance.productDetail,
      'views': instance.views,
      'likes': instance.likes,
      'isTrending': instance.isTrending,
      'isFavorite': instance.isFavorite,
      'isLike': instance.isLike,
    };
