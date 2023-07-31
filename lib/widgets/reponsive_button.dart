// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:dulich/constants/colors.dart';
import 'package:dulich/widgets/normal_text.dart';

class ResponsiveButtonConfigs {
  String? title;
  Color? titleColor;
  double? width, height;
  Image? icon;
  BorderRadiusConfig? radius;
  ResponsiveButtonConfigs({
    this.title,
    this.titleColor,
    this.height,
    this.icon,
    this.radius,
  });
}

class BorderRadiusConfig {
  late double lt, lb, rt, rb;
  BorderRadiusConfig({
    this.rb = 0,
    this.rt = 0,
    this.lb = 0,
    this.lt = 0,
  });
  BorderRadiusConfig.all(double radius) {
    lb = radius;
    lt = radius;
    rb = radius;
    rt = radius;
  }
}

class ResponsiveButton extends StatelessWidget {
  final ResponsiveButtonConfigs configs;
  const ResponsiveButton({
    Key? key,
    required this.configs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: configs.width,
      height: configs.height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: AppColors.main),
      child: Flexible(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (configs.title != null) ...[
            NormalText(
              configs.title!,
              color: configs.titleColor ?? AppColors.white,
            )
          ] else
            ...[],
          configs.icon ?? Image.asset("img/button-one.png")
        ]),
      ),
    );
  }
}
