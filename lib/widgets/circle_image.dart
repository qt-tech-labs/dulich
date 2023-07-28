import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/constraints.dart';
import '../constants/images.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      padding: AppConstraints.padding1,
      decoration: BoxDecoration(
          color: AppColors.black, borderRadius: BorderRadius.circular(50)),
      child: const CircleAvatar(
        backgroundColor: AppColors.black,
        foregroundImage: AssetImage(AppImages.dumAvatar),
      ),
    );
  }
}
