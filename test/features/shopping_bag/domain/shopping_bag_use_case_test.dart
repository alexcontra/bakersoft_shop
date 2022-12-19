import 'package:baker_soft_shop/features/preview_products/data/models/product_model/product_model.dart';
import 'package:baker_soft_shop/features/shop_bag/domain/repositories/shopping_bag_repository.dart';
import 'package:baker_soft_shop/features/shop_bag/domain/usecases/shopping_bag_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/src/mock.dart';
import 'package:mockito/annotations.dart';

import 'shopping_bag_use_case_test.mocks.dart';

@GenerateMocks([ShoppingBagRepository])
void main() {
  late MockShoppingBagRepository shoppingBagRepositoryMock;
  late ShoppingBagUseCase shoppingBagUseCase;
  final ProductModel product =
      ProductModel(title: 'DummyTitle', image: 'dummyImage');
  final List<ProductModel> dummyResponse = [
    ProductModel(title: 'DummyTitle', image: 'dummyImage')
  ];

  setUp(() {
    shoppingBagRepositoryMock = MockShoppingBagRepository();
    shoppingBagUseCase = ShoppingBagUseCase(shoppingBagRepositoryMock);
  });

  group('Shopping Bag usecase tests', () {
    test('Shopping Bag usecase test get ', () async {
      //set-up
      when(shoppingBagRepositoryMock.getUsersCart())
          .thenAnswer((_) async => Right(dummyResponse));
      //act
      await shoppingBagUseCase.getUserCart();
      //verify
      verify(shoppingBagRepositoryMock.getUsersCart());
    });
    test('Shopping Bag usecase test remove', () async {
      //set-up
      when(shoppingBagRepositoryMock.removeDataFromCart(product))
          .thenAnswer((_) async => Right(dummyResponse));
      //act
      await shoppingBagUseCase.removeDataFromCart(product);
      //verify
      verify(shoppingBagRepositoryMock.removeDataFromCart(product));
    });
  });
}
