import 'package:dartz/dartz.dart';

import 'package:baker_soft_shop/features/preview_products/data/models/news_feed_products/news_feed_products.dart';

import 'package:baker_soft_shop/core/error/failure.dart';

import '../../domain/repositories/preview_all_products_repository.dart';
import '../datasources/preview_all_products_data_source.dart';

class PreviewAllProductsRepositoryImpl implements PreviewAllProductsRepository {
  final PreviewAllProductsDatasource _previewAllProductsDatasource;
  PreviewAllProductsRepositoryImpl({
    required PreviewAllProductsDatasource previewAllProductsDatasource,
  }) : _previewAllProductsDatasource = previewAllProductsDatasource;
  @override
  Future<Either<Failure, NewsFeedModel>> getNewsFeedProducts() async {
    try {
      final dummyResponse =
          await _previewAllProductsDatasource.getNewsFeedProducts();
      return Right(dummyResponse);
    } catch (e) {
      return const Left(LocalFailure('Local failure'));
    }
  }
}
