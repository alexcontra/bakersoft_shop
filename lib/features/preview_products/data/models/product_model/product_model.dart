import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    String? image,
    String? title,
    double? price,
    List<String>? data,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  static Map<String, dynamic> toMap(ProductModel product) => {
        'image': product.image,
        'title': product.title,
        'price': product.price,
        'data': product.data
      };
  static String encode(List<ProductModel> products) => json.encode(
        products
            .map<Map<String, dynamic>>(
                (products) => ProductModel.toMap(products))
            .toList(),
      );

  static List<ProductModel> decode(String products) =>
      (json.decode(products) as List<dynamic>)
          .map<ProductModel>((item) => ProductModel.fromJson(item))
          .toList();
}
