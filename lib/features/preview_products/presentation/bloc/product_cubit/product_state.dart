part of 'product_cubit.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductSuccessState extends ProductState {}

class ProductFailureState extends ProductState {
  final Failure failure;

  ProductFailureState({required this.failure});

  @override
  List<Object?> get props => [failure];
}
