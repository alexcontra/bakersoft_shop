import 'package:baker_soft_shop/features/preview_products/data/models/news_feed_products/news_feed_products.dart';
import 'package:baker_soft_shop/features/preview_products/data/models/product_model/product_model.dart';
import 'package:baker_soft_shop/features/preview_products/domain/repositories/preview_all_products_repository.dart';
import 'package:baker_soft_shop/features/preview_products/domain/usecases/preview_all_products_usecase.dart';
import 'package:baker_soft_shop/features/preview_products/presentation/bloc/preview_all_products_cubit/preview_all_products_cubit.dart';
import 'package:baker_soft_shop/features/shop_bag/domain/repositories/shopping_bag_repository.dart';
import 'package:baker_soft_shop/features/shop_bag/domain/usecases/shopping_bag_usecase.dart';
import 'package:baker_soft_shop/features/shop_bag/presentation/bloc/shopping_bag_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/src/mock.dart';
import 'package:mockito/annotations.dart';

import 'shopping_bag_bloc_test.mocks.dart';

@GenerateMocks([ShoppingBagUseCase])
void main() {
  late MockShoppingBagUseCase shoppingBagUseCaseMock;
  final List<ProductModel> dummyResponse = [
    ProductModel(title: 'DummyTitle', image: 'dummyImage')
  ];
  final ProductModel productModel =
      ProductModel(title: 'DummyTitle', image: 'dummyImage');
  setUp(() {
    shoppingBagUseCaseMock = MockShoppingBagUseCase();
    when(shoppingBagUseCaseMock.getUserCart())
        .thenAnswer((_) async => Right(dummyResponse));
    when(shoppingBagUseCaseMock.removeDataFromCart(productModel))
        .thenAnswer((_) async => Right(dummyResponse));
  });
  group('Shopping Bag Cubit tests', () {
    blocTest<ShoppingBagCubit, ShoppingBagState>('Track get cubit shopping bag',
        build: () =>
            ShoppingBagCubit(shoppingBagUseCase: shoppingBagUseCaseMock),
        act: (cubit) => cubit.getProductsShoppingCart(),
        expect: () =>
            [isA<ShoppingBagLoadingState>(), isA<ShoppingBagSuccessState>()],
        verify: (cubit) {
          verify(shoppingBagUseCaseMock.getUserCart());
        });
    blocTest<ShoppingBagCubit, ShoppingBagState>(
        'Track write & get cubit shopping bag',
        build: () =>
            ShoppingBagCubit(shoppingBagUseCase: shoppingBagUseCaseMock),
        act: (cubit) => cubit.removeDataFromCart(productModel),
        expect: () => [
              isA<ShoppingBagInitialState>(),
              isA<ShoppingBagLoadingState>(),
              isA<ShoppingBagSuccessState>()
            ],
        verify: (cubit) {
          verify(shoppingBagUseCaseMock.removeDataFromCart(productModel));
        });
  });
}
