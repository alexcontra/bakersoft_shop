// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_feed_products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewsFeedProducts _$$_NewsFeedProductsFromJson(Map<String, dynamic> json) =>
    _$_NewsFeedProducts(
      topProduct: json['topProduct'] == null
          ? null
          : ProductModel.fromJson(json['topProduct'] as Map<String, dynamic>),
      productContent: (json['productContent'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_NewsFeedProductsToJson(_$_NewsFeedProducts instance) =>
    <String, dynamic>{
      'topProduct': instance.topProduct,
      'productContent': instance.productContent,
    };
