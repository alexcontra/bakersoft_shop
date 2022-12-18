part of 'shopping_bag_cubit.dart';

abstract class ShoppingBagState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ShoppingBagInitialState extends ShoppingBagState {}

class ShoppingBagLoadingState extends ShoppingBagState {}

class ShoppingBagSuccessState extends ShoppingBagState {
  final List<ProductModel> response;

  ShoppingBagSuccessState({required this.response});

  @override
  List<Object?> get props => [response];
}

class ShoppingBagSuccessEmptyListState extends ShoppingBagState {
  final List<ProductModel> response;

  ShoppingBagSuccessEmptyListState({required this.response});

  @override
  List<Object?> get props => [response];
}

class ShoppingBagFailureState extends ShoppingBagState {
  final Failure failure;

  ShoppingBagFailureState({required this.failure});

  @override
  List<Object?> get props => [failure];
}
