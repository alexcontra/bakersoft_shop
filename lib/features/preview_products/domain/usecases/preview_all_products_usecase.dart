import 'package:baker_soft_shop/features/preview_products/data/models/news_feed_products/news_feed_products.dart';
import 'package:baker_soft_shop/features/preview_products/domain/repositories/preview_all_products_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

class PreviewAllProductsUseCase {
  final PreviewAllProductsRepository previewAllProductsRepository;
  PreviewAllProductsUseCase(this.previewAllProductsRepository);

  Future<Either<Failure, NewsFeedModel>> call() async {
    return await previewAllProductsRepository.getNewsFeedProducts();
  }
}
