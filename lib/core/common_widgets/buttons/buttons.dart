import 'package:baker_soft_shop/features/preview_products/presentation/widgets/text_widget_view.dart';
import 'package:baker_soft_shop/specs/constraints.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../specs/colors.dart';
import '../../../specs/radius.dart';

class CustomRegularButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final double height;
  final double leftPadding;
  final double rightPadding;
  final double topPadding;
  final double bottomPadding;
  final String icon;

  const CustomRegularButton(
      {required this.onTap,
      required this.text,
      required this.height,
      required this.leftPadding,
      required this.rightPadding,
      required this.icon,
      this.topPadding = 22,
      this.bottomPadding = 22,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
            left: leftPadding,
            right: rightPadding,
            top: topPadding,
            bottom: bottomPadding),
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textWidget(text: text, size: 18, fontWeight: FontWeight.w500),
              Visibility(
                visible: icon.isNotEmpty,
                child: Padding(
                  padding: EdgeInsets.only(left: Paddings.P_14),
                  child: SvgPicture.asset(icon,
                      height: Heights.H_27, width: Heights.H_27),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
