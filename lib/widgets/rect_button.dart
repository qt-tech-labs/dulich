import 'package:flutter/material.dart';

import '../constants/colors.dart';

class RectButton extends ElevatedButton {
  RectButton(
      {super.key,
      required super.onPressed,
      required super.child,
      Size? minimumSize,
      Size? fixedSize,
      Size? maximumSize,
      Color? backgroundColor,
      Color? borderColor,
      double borderRadius = 10,
      EdgeInsets padding = const EdgeInsets.all(0)})
      : super(
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? AppColors.main,
              shadowColor: AppColors.gray,
              padding: padding,
              fixedSize: fixedSize,
              minimumSize: minimumSize,
              maximumSize: maximumSize,
              side:
                  BorderSide(width: 1.5, color: borderColor ?? AppColors.text1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius))),
        );
}
