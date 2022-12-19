import 'package:baker_soft_shop/features/preview_products/data/models/product_model/product_model.dart';
import 'package:baker_soft_shop/core/routes/navigator_routes.dart';
import 'package:baker_soft_shop/specs/constraints.dart';
import 'package:flutter/material.dart';

import '../../../../specs/colors.dart';
import '../../../../specs/radius.dart';
import '../../../../specs/text_sizes.dart';

class TopProductContainer extends StatelessWidget {
  final ProductModel productModel;
  const TopProductContainer({required this.productModel, super.key});

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
              Image.asset(
                productModel.image!,
                height: Heights.H_256,
                width: MediaQuery.of(context).size.width > 425
                    ? Heights.H_230
                    : Heights.H_180,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: Heights.H_150,
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
                  Expanded(
                      child: SizedBox(
                          width: 150,
                          height: 120,
                          child: ListView.builder(
                            itemCount: productModel.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(top: Paddings.P_8),
                                child: Text(
                                  productModel.data![index],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.LIGHT_GREY,
                                    fontSize: TextSizes.TS_16,
                                  ),
                                ),
                              );
                            },
                          ))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
