import 'package:baker_soft_shop/features/preview_products/data/models/product_model/product_model.dart';
import 'package:baker_soft_shop/core/routes/navigator_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../specs/assets.dart';
import '../../../../specs/colors.dart';
import '../../../../specs/constraints.dart';
import '../../../../specs/radius.dart';
import '../../../../specs/text_sizes.dart';

class ProductView extends StatelessWidget {
  final ProductModel productModel;
  const ProductView({required this.productModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Paddings.P_22, right: Paddings.P_22, top: Paddings.P_16),
      child: GestureDetector(
        onTap: () {
          getToProductPage(context, productModel);
        },
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.LIGHT_GREY,
                  spreadRadius: 1,
                  blurRadius: AppRadius.RADIUS_10,
                )
              ],
              color: AppColors.WHITE,
              borderRadius: BorderRadius.circular(AppRadius.RADIUS_10)),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: Paddings.P_6,
                      bottom: Paddings.P_6,
                      right: Paddings.P_32),
                  child: Image.asset(
                    productModel.image!,
                    height: Heights.H_150,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(top: Paddings.P_8),
                        child: Text(
                          productModel.title!,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.DARK_GREEN,
                            fontSize: TextSizes.TS_20,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Paddings.P_8),
                      child: Text(
                        productModel.data![0],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.LIGHT_GREY,
                          fontSize: TextSizes.TS_16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Paddings.P_8),
                      child: Text(
                        productModel.data![1],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.LIGHT_GREY,
                          fontSize: TextSizes.TS_16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Paddings.P_8),
                      child: Text(
                        productModel.data![2],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.LIGHT_GREY,
                          fontSize: TextSizes.TS_16,
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: Paddings.P_8),
                          child: Text(
                            'See more...',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColors.LIGHT_GREY,
                              fontSize: TextSizes.TS_16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: Paddings.P_64, top: Paddings.P_8),
                          child: RotatedBox(
                            quarterTurns: 2,
                            child: SvgPicture.asset(
                              Assets.BACK_ARROW,
                              width: 20,
                              height: 23,
                              color: AppColors.DARK_GREEN,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
