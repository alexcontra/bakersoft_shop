import 'package:baker_soft_shop/features/preview_products/domain/usecases/preview_all_products_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import '../../../../../core/error/failure.dart';
import '../../../data/models/news_feed_products/news_feed_products.dart';
part 'preview_all_products_state.dart';

class PreviewAllProductsCubit extends Cubit<PreviewAllProductsState> {
  final PreviewAllProductsUseCase previewAllProductsUseCase;
  PreviewAllProductsCubit({required this.previewAllProductsUseCase})
      : super(PreviewAllProductsInitialState());

  void getAllProductsContent() async {
    emit(PreviewAllProductsLoadingState());
    final failureOrEntity = await previewAllProductsUseCase();
    if (failureOrEntity.isRight()) {
      emit(failureOrEntity.foldRight(
          PreviewAllProductsFailureState(
              failure: const LocalFailure('failure')),
          (r, previous) => PreviewAllProductsSuccessState(response: r)));
    }
  }
}
