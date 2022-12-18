import 'package:baker_soft_shop/features/preview_products/data/datasources/product_datasource.dart';
import 'package:baker_soft_shop/features/preview_products/data/models/product_model/product_model.dart';
import 'package:dartz/dartz.dart';

import 'package:baker_soft_shop/core/error/failure.dart';

import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource _productsDatasource;
  ProductRepositoryImpl({
    required ProductDataSource productDataSource,
  }) : _productsDatasource = productDataSource;
  @override
  Future<Either<Failure, bool>> saveCurrentProductInLocalStore(
      ProductModel productModel) async {
    try {
      final bool saveProduct =
          await _productsDatasource.saveProductInLocalStorage(productModel);
      return Right(saveProduct);
    } catch (e) {
      return const Left(LocalFailure('Product is not saved'));
    }
  }
}
