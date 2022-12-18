import 'package:flutter/material.dart';

import '../../../../specs/colors.dart';

Text textWidget({
  required String text,
  required double size,
  required FontWeight fontWeight,
  TextAlign align = TextAlign.left,
  Color color = AppColors.DARK_GREEN,
}) =>
    Text(text,
        textAlign: align,
        style: TextStyle(
          fontWeight: fontWeight,
          color: color,
          fontSize: size,
        ));
