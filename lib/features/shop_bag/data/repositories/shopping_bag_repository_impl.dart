import 'package:baker_soft_shop/features/preview_products/data/models/product_model/product_model.dart';
import 'package:baker_soft_shop/core/error/failure.dart';
import 'package:baker_soft_shop/features/shop_bag/domain/repositories/shopping_bag_repository.dart';
import 'package:dartz/dartz.dart';

import '../datasources/shopping_bag_get_products_datasource.dart';

class ShoppingBagRepositoryImpl implements ShoppingBagRepository {
  final ShoppingBagDataSource _shoppingBagDataSource;
  ShoppingBagRepositoryImpl({
    required ShoppingBagDataSource shoppingBagDataSource,
  }) : _shoppingBagDataSource = shoppingBagDataSource;
  @override
  Future<Either<Failure, List<ProductModel>>> getUsersCart() async {
    try {
      final products = await _shoppingBagDataSource.getBagContnet();
      return Right(products);
    } catch (e) {
      return const Left(LocalFailure('Failed to get products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> removeDataFromCart(
      ProductModel product) async {
    try {
      final products = await _shoppingBagDataSource.removeBagContent(product);
      return Right(products);
    } catch (e) {
      return const Left(LocalFailure('Failed to get products'));
    }
  }
}
