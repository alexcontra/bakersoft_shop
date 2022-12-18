import 'package:baker_soft_shop/features/preview_products/data/models/product_model/product_model.dart';
import 'package:baker_soft_shop/features/preview_products/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

class ProductUseCase {
  final ProductRepository previewAllProductsRepository;
  ProductUseCase(this.previewAllProductsRepository);

  Future<Either<Failure, bool>> call(ProductModel productModel) async {
    return await previewAllProductsRepository
        .saveCurrentProductInLocalStore(productModel);
  }
}
