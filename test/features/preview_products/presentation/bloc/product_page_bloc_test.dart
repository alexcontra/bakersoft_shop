import 'package:baker_soft_shop/features/preview_products/data/models/product_model/product_model.dart';
import 'package:baker_soft_shop/features/preview_products/domain/repositories/product_repository.dart';
import 'package:baker_soft_shop/features/preview_products/domain/usecases/product_usecase.dart';
import 'package:baker_soft_shop/features/preview_products/presentation/bloc/product_cubit/product_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/src/mock.dart';
import 'package:mockito/annotations.dart';

import 'product_page_bloc_test.mocks.dart';

@GenerateMocks([ProductUseCase, ProductRepository])
void main() {
  late MockProductUseCase productUseCaseMock;
  // ignore: unused_local_variable
  late MockProductRepository productRepositoryMock;
  final productModel = ProductModel(title: 'DummyTitle', image: 'dummyImage');
  setUp(() {
    productUseCaseMock = MockProductUseCase();
    productRepositoryMock = MockProductRepository();
    when(productUseCaseMock.call(productModel))
        .thenAnswer((_) async => const Right(true));
  });
  blocTest<ProductCubit, ProductState>('Track Product Cubit setProduct',
      build: () => ProductCubit(productUseCase: productUseCaseMock),
      act: (cubit) => cubit.setProduct(productModel),
      expect: () => [isA<ProductLoadingState>(), isA<ProductSuccessState>()],
      verify: (cubit) {
        verify(productUseCaseMock.call(productModel));
      });
}
