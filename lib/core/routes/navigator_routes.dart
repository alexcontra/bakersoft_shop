import 'package:baker_soft_shop/features/preview_products/data/models/product_model/product_model.dart';
import 'package:baker_soft_shop/features/preview_products/presentation/pages/product_page_view.dart';
import 'package:baker_soft_shop/features/shop_bag/presentation/bloc/shopping_bag_cubit.dart';
import 'package:baker_soft_shop/features/shop_bag/presentation/pages/shopping_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/dependency_injection/injection_container.dart';
import '../../features/preview_products/presentation/bloc/product_cubit/product_cubit.dart';

getToProductPage(BuildContext context, ProductModel productModel) =>
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider<ProductCubit>(
                  create: (_) => injector<ProductCubit>(),
                  child: ProductPageBodyProvider(productModel: productModel),
                )));

getToBagPage(BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => BlocProvider<ShoppingBagCubit>(
              create: (_) => injector<ShoppingBagCubit>(),
              child: const ShoppingPageBody(),
            )));
