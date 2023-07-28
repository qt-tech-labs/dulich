import 'package:dulich/constants/colors.dart';
import 'package:dulich/constants/string.dart';
import 'package:dulich/widgets/large_text.dart';
import 'package:dulich/widgets/normal_text.dart';
import 'package:dulich/widgets/reponsive_button.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => __SplashState();
}

class __SplashState extends State<Splash> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("img/${images[index]}"),
                    fit: BoxFit.cover),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LargeText(text: Strings.splash.travel),
                          NormalText(
                            text: Strings.splash.adventure,
                            size: 30,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 250,
                            child: NormalText(
                                color: AppColors.textColor2,
                                size: 14,
                                text: Strings.splash.quote),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ResponsiveButton(
                              configs: ResponsiveButtonConfigs(title: "Next"))
                        ],
                      ),
                      Column(
                        children: List.generate(3, (dotIndex) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            width: 8,
                            height: index == dotIndex ? 25 : 8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: index == dotIndex
                                    ? AppColors.mainColor
                                    : AppColors.textColor1),
                          );
                        }),
                      )
                    ]),
              ),
            );
          }),
    );
  }
}
