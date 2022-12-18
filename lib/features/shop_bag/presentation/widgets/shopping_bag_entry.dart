import 'package:baker_soft_shop/features/preview_products/presentation/widgets/text_widget_view.dart';
import 'package:baker_soft_shop/specs/constraints.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../specs/assets.dart';
import '../../../../specs/colors.dart';
import '../../../../specs/radius.dart';
import '../../../../specs/text_sizes.dart';

class ShoppingBagEntry extends StatelessWidget {
  final String title;
  final double price;
  final void Function()? onPressed;
  const ShoppingBagEntry(
      {required this.title,
      required this.price,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Paddings.P_22, right: Paddings.P_22, top: Paddings.P_14),
      child: Container(
        height: Heights.H_64,
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
        child: Padding(
          padding: EdgeInsets.only(left: Paddings.P_14, right: Paddings.P_14),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textWidget(
                    text: title,
                    size: TextSizes.TS_20,
                    fontWeight: FontWeight.w400),
                textWidget(
                    text: '\$$price',
                    size: TextSizes.TS_20,
                    fontWeight: FontWeight.w400),
                Center(
                  child: IconButton(
                    onPressed: onPressed,
                    icon: SvgPicture.asset(Assets.REMOVE, height: Heights.H_27),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
