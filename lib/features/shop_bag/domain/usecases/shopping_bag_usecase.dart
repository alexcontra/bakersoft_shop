import 'package:baker_soft_shop/features/preview_products/data/models/product_model/product_model.dart';
import 'package:baker_soft_shop/features/shop_bag/domain/repositories/shopping_bag_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

class ShoppingBagUseCase {
  final ShoppingBagRepository shoppingBagRepository;
  ShoppingBagUseCase(this.shoppingBagRepository);

  Future<Either<Failure, List<ProductModel>>> getUserCart() async {
    return await shoppingBagRepository.getUsersCart();
  }

  Future<Either<Failure, List<ProductModel>>> removeDataFromCart(
      ProductModel product) async {
    return await shoppingBagRepository.removeDataFromCart(product);
  }
}
