import 'package:dulich/constants/colors.dart';
import 'package:dulich/constants/constraints.dart';
import 'package:dulich/constants/string.dart';
import 'package:dulich/widgets/large_text.dart';
import 'package:dulich/widgets/normal_text.dart';
import 'package:flutter/material.dart';

import '../../widgets/circle_image.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
          child:
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.menu,
              size: 30,
              color: AppColors.black,
            ),
            Spacer(),
            CircleImage(),
          ]),
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          padding: AppConstraints.left.s15,
          child: LargeText(text: Strings.splash.adventure),
        ),
        Container(
          width: double.maxFinite,
          height: 100,
          child: TabBar(
            isScrollable: true,
            controller: _tabController,
            tabs: const [
              Tab(
                child: NormalText(text: "Places"),
              ),
              Tab(text: "Places"),
              Tab(text: "Places"),
            ],
          ),
        ),
        Expanded(
            child: TabBarView(controller: _tabController, children: const [
          Center(
            child: Text("1"),
          ),
          Center(
            child: Text("2"),
          ),
          Center(
            child: Text("3"),
          ),
        ]))
      ]),
    );
  }
}
