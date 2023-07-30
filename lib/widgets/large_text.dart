// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dulich/constants/colors.dart';
import 'package:flutter/material.dart';

class LargeText extends Text {
  final double size;
  final Color color;
  LargeText(
    super.data, {
    super.key,
    this.size = 30,
    this.color = AppColors.main,
  }) : super(style: TextStyle(color: color, fontSize: size));
}
