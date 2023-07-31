import 'package:dulich/constants/colors.dart';
import 'package:dulich/constants/constraints.dart';
import 'package:dulich/constants/string.dart';
import 'package:dulich/constants/styles.dart';
import 'package:dulich/pages/detail_page.dart';
import 'package:dulich/widgets/large_text.dart';
import 'package:dulich/widgets/normal_text.dart';
import 'package:flutter/material.dart';

import '../../widgets/circle_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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

  var tabs = [
    (title: "Places", icon: const Icon(Icons.home)),
    (title: "Suggest", icon: const Icon(Icons.recommend)),
    (title: "Japan", icon: const Icon(Icons.star)),
  ];

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
          child: LargeText(Strings.splash.adventure),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: TabBar(
              labelPadding: EdgeInsets.only(left: 10, right: 10),
              dividerColor: Colors.transparent,
              indicator: CirleTabIndicator(color: AppColors.main, radius: 4),
              isScrollable: true,
              controller: _tabController,
              labelStyle: AppStyles.mainTextStyle,
              labelColor: AppColors.main,
              unselectedLabelColor: AppColors.gray,
              tabs: tabs
                  .map((e) => Tab(
                        child: NormalText(Strings.travel),
                      ))
                  .toList()),
        ),
        Container(
            margin: const EdgeInsets.only(top: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(controller: _tabController, children: [
              ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.white,
                      image: const DecorationImage(
                          image: AssetImage("img/mountain.jpeg"),
                          fit: BoxFit.cover),
                    ),
                  );
                },
              ),
              Center(
                child: Text("2"),
              ),
              Center(
                child: Text("3"),
              ),
            ])),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: AppConstraints.mx(20),
          child: Row(
            children: [
              LargeText(
                Strings.exploreMore,
                size: 22,
              ),
              Spacer(),
              NormalText(Strings.seeAll)
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          width: double.maxFinite,
          height: 100,
          // color: AppColors.bigText,
          // margin: const EdgeInsets.only(left: 20),
          child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Ink(
                  width: 80,
                  child: InkWell(
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailPage()))
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.lightGray),
                          child: const Center(
                              child: Icon(
                            Icons.kayaking,
                            color: AppColors.main,
                          )),
                        ),
                        Center(
                          child: NormalText("Kayaking"),
                        )
                      ],
                    ),
                  ),
                );
              }),
        )
      ]),
    );
  }
}

class CirleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CirleTabIndicator({required Color color, required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _painter;
  }
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Offset circleOffset = offset +
        Offset(
            configuration.size!.width / 2, configuration.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
