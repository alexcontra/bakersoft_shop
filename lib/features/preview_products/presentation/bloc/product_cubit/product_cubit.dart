import 'package:baker_soft_shop/features/preview_products/data/models/product_model/product_model.dart';
import 'package:baker_soft_shop/features/preview_products/domain/usecases/product_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import '../../../../../core/error/failure.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductUseCase productUseCase;
  ProductCubit({required this.productUseCase}) : super(ProductInitialState());

  void setProduct(ProductModel productModel) async {
    emit(ProductLoadingState());
    final failureOrEntity = await productUseCase(productModel);
    if (failureOrEntity.isRight()) {
      emit(failureOrEntity.foldRight(
          ProductFailureState(failure: const LocalFailure('failure')),
          (r, previous) => ProductSuccessState()));
    }
  }
}
