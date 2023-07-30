import 'package:dulich/constants/colors.dart';
import 'package:flutter/material.dart';

class NormalText extends Text {
  final double size;
  final Color color;
  NormalText(super.data,
      {super.key,
      this.size = 16,
      this.color = AppColors.gray,
      FontWeight fontWeight = FontWeight.w600})
      : super(
            style: TextStyle(
                color: color, fontSize: size, fontWeight: fontWeight));
}
