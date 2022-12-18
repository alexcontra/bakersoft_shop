import 'package:baker_soft_shop/core/common_widgets/app_bar/app_bar_view.dart';
import 'package:baker_soft_shop/core/common_widgets/buttons/buttons.dart';

import 'package:baker_soft_shop/features/preview_products/data/models/product_model/product_model.dart';
import 'package:baker_soft_shop/features/preview_products/presentation/widgets/text_widget_view.dart';
import 'package:baker_soft_shop/specs/assets.dart';
import 'package:baker_soft_shop/specs/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../specs/constraints.dart';
import '../../../../specs/text_sizes.dart';
import '../bloc/product_cubit/product_cubit.dart';

class ProductPageBodyProvider extends StatelessWidget {
  final ProductModel productModel;
  const ProductPageBodyProvider({required this.productModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      appBar: CustomAppBar(
        title: productModel.title!,
        isProfile: false,
        isBackButton: true,
        isShoppingCart: true,
      ),
      body: ProductPageBody(productModel: productModel),
    );
  }
}

class ProductPageBody extends StatelessWidget {
  final ProductModel productModel;

  const ProductPageBody({required this.productModel, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: Paddings.P_6,
                  bottom: Paddings.P_6,
                  right: Paddings.P_32,
                  left: Paddings.P_32),
              child: Image.asset(
                productModel.image!,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: Paddings.P_22, top: Paddings.P_22),
                  child: textWidget(
                      text: 'Price',
                      size: TextSizes.TS_22,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: Paddings.P_22, top: Paddings.P_22),
                  child: textWidget(
                      text: '\$${productModel.price}',
                      size: TextSizes.TS_22,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: Paddings.P_22, top: Paddings.P_22),
              child: textWidget(
                  text: 'Details',
                  size: TextSizes.TS_22,
                  fontWeight: FontWeight.w600),
            ),
            Expanded(
              flex: 0,
              child: SizedBox(
                height: Heights.H_100,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: Paddings.P_22),
                  itemCount: productModel.data!.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: EdgeInsets.only(top: Paddings.P_5),
                        child: textWidget(
                            text: productModel.data![index],
                            size: TextSizes.TS_18,
                            fontWeight: FontWeight.w300));
                  },
                ),
              ),
            ),
            CustomRegularButton(
              onTap: () {
                ///Store product in [SharedPreferences]
                context.read<ProductCubit>().setProduct(productModel);
              },
              text: 'Add to cart',
              height: Heights.H_64,
              leftPadding: Paddings.P_22,
              rightPadding: Paddings.P_22,
              icon: Assets.SHOPPING_CART,
            )
          ],
        );
      },
    );
  }
}
