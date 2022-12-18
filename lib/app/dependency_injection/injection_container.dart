import 'dart:async';

import 'package:baker_soft_shop/features/preview_products/data/datasources/preview_all_products_data_source.dart';
import 'package:baker_soft_shop/features/preview_products/data/datasources/product_datasource.dart';
import 'package:baker_soft_shop/features/preview_products/data/repositories/preview_all_products_repository_impl.dart';
import 'package:baker_soft_shop/features/preview_products/data/repositories/product_repository_impl.dart';
import 'package:baker_soft_shop/features/preview_products/domain/repositories/preview_all_products_repository.dart';
import 'package:baker_soft_shop/features/preview_products/domain/repositories/product_repository.dart';
import 'package:baker_soft_shop/features/preview_products/domain/usecases/preview_all_products_usecase.dart';
import 'package:baker_soft_shop/features/preview_products/domain/usecases/product_usecase.dart';
import 'package:baker_soft_shop/features/preview_products/presentation/bloc/preview_all_products_cubit/preview_all_products_cubit.dart';
import 'package:baker_soft_shop/features/preview_products/presentation/bloc/product_cubit/product_cubit.dart';
import 'package:baker_soft_shop/features/shop_bag/data/datasources/shopping_bag_get_products_datasource.dart';
import 'package:baker_soft_shop/features/shop_bag/data/repositories/shopping_bag_repository_impl.dart';
import 'package:baker_soft_shop/features/shop_bag/domain/repositories/shopping_bag_repository.dart';
import 'package:baker_soft_shop/features/shop_bag/domain/usecases/shopping_bag_usecase.dart';
import 'package:baker_soft_shop/features/shop_bag/presentation/bloc/shopping_bag_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/shared_preferences/shared_preferences.dart';
import '../../core/shared_preferences/shared_preferences_impl.dart';

final injector = GetIt.instance;

FutureOr<void> initContainer() async {
  await _initDepenencies();
}

FutureOr<void> _initDepenencies() async {
  ///Other

  /// SharedPreferences dependencies
  final sharedPreferences = await SharedPreferences.getInstance();

  injector.registerLazySingleton<SharedPreferencesAbstract>(
      () => SharedPreferencesImpl(sharedPreferences: sharedPreferences));

  ///Blocs
  injector.registerFactory<PreviewAllProductsCubit>(
      () => PreviewAllProductsCubit(previewAllProductsUseCase: injector()));
  //
  injector.registerFactory<ProductCubit>(
      () => ProductCubit(productUseCase: injector()));
  //
  injector.registerFactory<ShoppingBagCubit>(
      () => ShoppingBagCubit(shoppingBagUseCase: injector()));

  ///Usecases
  injector.registerFactory(() => PreviewAllProductsUseCase(injector()));
  injector.registerFactory(() => ProductUseCase(injector()));
  injector.registerFactory(() => ShoppingBagUseCase(injector()));

  ///Repositories
  injector.registerFactory<PreviewAllProductsRepository>(() =>
      PreviewAllProductsRepositoryImpl(
          previewAllProductsDatasource: injector()));

  injector.registerFactory<ProductRepository>(
      () => ProductRepositoryImpl(productDataSource: injector()));
  //
  injector.registerFactory<ShoppingBagRepository>(
      () => ShoppingBagRepositoryImpl(shoppingBagDataSource: injector()));

  ///Datasources
  injector.registerFactory<PreviewAllProductsDatasource>(
      () => PreviewAllProductsDatasourceImpl());
  //
  injector.registerFactory<ProductDataSource>(() => ProductDataSourceImpl());
  //
  injector.registerFactory<ShoppingBagDataSource>(
      () => ShoppingBagDataSourceImpl());
}
