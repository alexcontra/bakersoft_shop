import 'package:baker_soft_shop/features/preview_products/data/models/news_feed_products/news_feed_products.dart';
import 'package:baker_soft_shop/features/preview_products/data/models/product_model/product_model.dart';
import 'package:baker_soft_shop/features/preview_products/domain/repositories/preview_all_products_repository.dart';
import 'package:baker_soft_shop/features/preview_products/domain/usecases/preview_all_products_usecase.dart';
import 'package:baker_soft_shop/features/preview_products/presentation/bloc/preview_all_products_cubit/preview_all_products_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/src/mock.dart';
import 'package:mockito/annotations.dart';

import 'preview_all_products_bloc_test.mocks.dart';

@GenerateMocks([PreviewAllProductsUseCase, PreviewAllProductsRepository])
void main() {
  // ignore: unused_local_variable
  late MockPreviewAllProductsRepository previewAllProductsRepositoryMock;
  late MockPreviewAllProductsUseCase previewAllProductsUseCaseMock;
  final dummyResponse = NewsFeedModel(
      topProduct: ProductModel(title: 'DummyTitle', image: 'dummyImage'),
      productContent: [
        ProductModel(title: 'DummyTitle2', image: 'dummyImage2'),
        ProductModel(title: 'DummyTitle3', image: 'dummyImage3')
      ]);
  setUp(() {
    previewAllProductsRepositoryMock = MockPreviewAllProductsRepository();
    previewAllProductsUseCaseMock = MockPreviewAllProductsUseCase();
    when(previewAllProductsUseCaseMock.call())
        .thenAnswer((_) async => Right(dummyResponse));
  });
  blocTest<PreviewAllProductsCubit, PreviewAllProductsState>(
      'Track cubit get all products',
      build: () => PreviewAllProductsCubit(
          previewAllProductsUseCase: previewAllProductsUseCaseMock),
      act: (cubit) => cubit.getAllProductsContent(),
      expect: () => [
            isA<PreviewAllProductsLoadingState>(),
            isA<PreviewAllProductsSuccessState>()
          ],
      verify: (cubit) {
        verify(previewAllProductsUseCaseMock.call());
      });
}
