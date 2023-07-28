// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:dulich/constants/colors.dart';

class AppConstraints {
  AppConstraints._();
  static const EdgeInsets padding10 = EdgeInsets.all(10);
  static const EdgeInsets padding5 = EdgeInsets.all(5);
  static const EdgeInsets padding1 = EdgeInsets.all(1);
  static const EdgeInsets padding = EdgeInsets.all(0);
  static SpaceLeft left = SpaceLeft();
}

class SpaceLeft {
  SpaceLeft();
  final EdgeInsets s5 = const EdgeInsets.only(left: 5);
  final EdgeInsets s10 = const EdgeInsets.only(left: 10);
  final EdgeInsets s15 = const EdgeInsets.only(left: 15);
}

class DecorationBuilder {
  EdgeInsets? padding = AppConstraints.padding;
  Color? backgroundColor = AppColors.white;
  DecorationBuilder({
    this.padding,
    this.backgroundColor,
  });
}
