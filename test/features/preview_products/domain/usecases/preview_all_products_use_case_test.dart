import 'package:baker_soft_shop/features/preview_products/data/models/news_feed_products/news_feed_products.dart';
import 'package:baker_soft_shop/features/preview_products/data/models/product_model/product_model.dart';
import 'package:baker_soft_shop/features/preview_products/domain/repositories/preview_all_products_repository.dart';
import 'package:baker_soft_shop/features/preview_products/domain/usecases/preview_all_products_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/src/mock.dart';
import 'package:mockito/annotations.dart';

import 'preview_all_products_use_case_test.mocks.dart';

@GenerateMocks([PreviewAllProductsRepository])
void main() {
  late MockPreviewAllProductsRepository previewAllProductsRepositoryMock;
  late PreviewAllProductsUseCase previewAllProductsUseCase;
  final dummyResponse = NewsFeedModel(
      topProduct: ProductModel(title: 'DummyTitle', image: 'dummyImage'),
      productContent: [
        ProductModel(title: 'DummyTitle2', image: 'dummyImage2'),
        ProductModel(title: 'DummyTitle3', image: 'dummyImage3')
      ]);
  setUp(() {
    previewAllProductsRepositoryMock = MockPreviewAllProductsRepository();
    previewAllProductsUseCase =
        PreviewAllProductsUseCase(previewAllProductsRepositoryMock);
  });

  test('Preview data usecase test', () async {
    //set-up
    when(previewAllProductsRepositoryMock.getNewsFeedProducts())
        .thenAnswer((_) async => Right(dummyResponse));
    //act
    await previewAllProductsUseCase.call();
    //verify
    verify(previewAllProductsRepositoryMock.getNewsFeedProducts());
  });
}
