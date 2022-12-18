import 'package:baker_soft_shop/features/preview_products/data/models/product_model/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_feed_products.freezed.dart';
part 'news_feed_products.g.dart';

@freezed
class NewsFeedModel with _$NewsFeedModel {
  factory NewsFeedModel({
    ProductModel? topProduct,
    List<ProductModel>? productContent,
  }) = _NewsFeedProducts;

  factory NewsFeedModel.fromJson(Map<String, dynamic> json) =>
      _$NewsFeedModelFromJson(json);
}
