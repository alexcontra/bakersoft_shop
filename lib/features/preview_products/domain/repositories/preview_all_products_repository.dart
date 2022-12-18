import 'package:baker_soft_shop/features/preview_products/data/models/news_feed_products/news_feed_products.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class PreviewAllProductsRepository {
  Future<Either<Failure, NewsFeedModel>> getNewsFeedProducts();
}
