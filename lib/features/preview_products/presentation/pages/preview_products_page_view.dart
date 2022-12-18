import 'package:baker_soft_shop/app/dependency_injection/injection_container.dart';
import 'package:baker_soft_shop/core/common_widgets/app_bar/app_bar_view.dart';
import 'package:baker_soft_shop/features/preview_products/presentation/widgets/product_view.dart';
import 'package:baker_soft_shop/features/preview_products/presentation/widgets/text_widget_view.dart';
import 'package:baker_soft_shop/features/preview_products/presentation/widgets/top_product_view.dart';
import 'package:baker_soft_shop/specs/constraints.dart';
import 'package:baker_soft_shop/specs/text_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../specs/colors.dart';
import '../bloc/preview_all_products_cubit/preview_all_products_cubit.dart';

class PreviewProductsBodyProvider extends StatelessWidget {
  const PreviewProductsBodyProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      appBar: CustomAppBar(title: 'Products'),
      body: BlocProvider<PreviewAllProductsCubit>(
          create: (_) => injector<PreviewAllProductsCubit>(),
          child: const PreviewProductsBody()),
    );
  }
}

class PreviewProductsBody extends StatelessWidget {
  const PreviewProductsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreviewAllProductsCubit, PreviewAllProductsState>(
        builder: (context, state) {
      ///Get data from response if state is [PreviewAllProductsInitialState]
      if (state is PreviewAllProductsInitialState) {
        ///Call of the "API"
        context.read<PreviewAllProductsCubit>().getAllProductsContent();
      }

      ///Loading UI if state is [PreviewAllProductsLoadingState]
      if (state is PreviewAllProductsLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );

        /// Render UI if state is [PreviewAllProductsSuccessState]
      } else if (state is PreviewAllProductsSuccessState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(left: Paddings.P_22),
                child: textWidget(
                    text: 'Welcome to \nBakerSoft Shop',
                    size: 32,
                    fontWeight: FontWeight.w400,
                    color: AppColors.LIGHT_GREY)),
            Padding(
                padding:
                    EdgeInsets.only(left: Paddings.P_22, top: Paddings.P_32),
                child: textWidget(
                    text: 'Top product this week',
                    size: TextSizes.TS_22,
                    fontWeight: FontWeight.w600)),
            Flexible(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .3,
                child: TopProductContainer(
                  productModel: state.response.topProduct!,
                ),
              ),
            ),
            Padding(
                padding:
                    EdgeInsets.only(left: Paddings.P_22, top: Paddings.P_32),
                child: textWidget(
                    text: 'Check other products',
                    size: TextSizes.TS_22,
                    fontWeight: FontWeight.w600)),
            Expanded(
                child: ListView.builder(
              itemCount: state.response.productContent!.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductView(
                    productModel: state.response.productContent![index]);
              },
            ))
          ],
        );
      } else {
        return const Center(
          child: Text('Failed to fetch data!'),
        );
      }
    });
  }
}
