import 'package:baker_soft_shop/features/preview_products/data/models/product_model/product_model.dart';
import 'package:baker_soft_shop/features/preview_products/domain/repositories/product_repository.dart';
import 'package:baker_soft_shop/features/preview_products/domain/usecases/product_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/src/mock.dart';
import 'package:mockito/annotations.dart';

import 'product_usecase_test.mocks.dart';

@GenerateMocks([ProductRepository])
void main() {
  late MockProductRepository productRepositoryMock;
  late ProductUseCase productUseCase;
  final testProduct = ProductModel(title: 'DummyTitle', image: 'dummyImage');
  setUp(() {
    productRepositoryMock = MockProductRepository();
    productUseCase = ProductUseCase(productRepositoryMock);
  });

  test('Product  usecase test', () async {
    //set-up
    when(productRepositoryMock.saveCurrentProductInLocalStore(testProduct))
        .thenAnswer((_) async => const Right(true));
    //act
    await productUseCase.call(testProduct);
    //verify
    verify(productRepositoryMock..saveCurrentProductInLocalStore(testProduct));
  });
}
