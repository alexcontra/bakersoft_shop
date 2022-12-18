part of 'preview_all_products_cubit.dart';

abstract class PreviewAllProductsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PreviewAllProductsInitialState extends PreviewAllProductsState {}

class PreviewAllProductsLoadingState extends PreviewAllProductsState {}

class PreviewAllProductsSuccessState extends PreviewAllProductsState {
  final NewsFeedModel response;

  PreviewAllProductsSuccessState({required this.response});

  @override
  List<Object?> get props => [response];
}

class PreviewAllProductsFailureState extends PreviewAllProductsState {
  final Failure failure;

  PreviewAllProductsFailureState({required this.failure});

  @override
  List<Object?> get props => [failure];
}
