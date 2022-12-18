import 'package:baker_soft_shop/features/preview_products/data/models/product_model/product_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class ProductRepository {
  Future<Either<Failure, bool>> saveCurrentProductInLocalStore(
      ProductModel productModel);
}
