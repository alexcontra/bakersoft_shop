import 'package:flutter/widgets.dart';

import '../../../../core/common_widgets/buttons/buttons.dart';
import '../../../../specs/constraints.dart';
import '../../../../specs/text_sizes.dart';
import '../../../preview_products/presentation/widgets/text_widget_view.dart';

class BottomAction extends StatelessWidget {
  final double price;
  const BottomAction({required this.price, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(left: Paddings.P_22, bottom: Paddings.P_32),
          child: textWidget(
              text: 'Price \$$price',
              size: TextSizes.TS_22,
              fontWeight: FontWeight.w500),
        ),
        CustomRegularButton(
            onTap: () {},
            text: 'Oreder now',
            height: Heights.H_64,
            leftPadding: Paddings.P_22,
            rightPadding: Paddings.P_22,
            topPadding: Paddings.P_0,
            bottomPadding: Paddings.P_64,
            icon: '')
      ],
    );
  }
}
