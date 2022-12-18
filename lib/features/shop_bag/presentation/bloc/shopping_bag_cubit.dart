import 'package:baker_soft_shop/features/preview_products/data/models/product_model/product_model.dart';
import 'package:baker_soft_shop/features/shop_bag/domain/usecases/shopping_bag_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import '../../../../../core/error/failure.dart';
part 'shopping_bag_state.dart';

class ShoppingBagCubit extends Cubit<ShoppingBagState> {
  final ShoppingBagUseCase shoppingBagUseCase;
  ShoppingBagCubit({required this.shoppingBagUseCase})
      : super(ShoppingBagInitialState());

  void getProductsShoppingCart() async {
    emit(ShoppingBagLoadingState());
    final failureOrEntity = await shoppingBagUseCase.getUserCart();
    if (failureOrEntity.isRight()) {
      emit(failureOrEntity.foldRight(
          ShoppingBagFailureState(
              failure: const LocalFailure('Failed to get data')),
          (r, previous) {
        if (r.isEmpty) {
          return ShoppingBagSuccessEmptyListState(response: r);
        } else {
          return ShoppingBagSuccessState(response: r);
        }
      }));
    } else {
      emit(ShoppingBagFailureState(
          failure: const LocalFailure('Failed to get data')));
    }
  }

  void removeDataFromCart(ProductModel product) async {
    emit(ShoppingBagInitialState());
    emit(ShoppingBagLoadingState());
    final failureOrEntity =
        await shoppingBagUseCase.removeDataFromCart(product);
    if (failureOrEntity.isRight()) {
      emit(failureOrEntity.foldRight(
          ShoppingBagFailureState(
              failure: const LocalFailure('Failed to get data')),
          (r, previous) {
        if (r.isEmpty) {
          return ShoppingBagSuccessEmptyListState(response: r);
        } else {
          return ShoppingBagSuccessState(response: r);
        }
      }));
    } else {
      emit(ShoppingBagFailureState(
          failure: const LocalFailure('Failed to get data')));
    }
  }
}
