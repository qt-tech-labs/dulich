import 'package:dulich/constants/colors.dart';
import 'package:dulich/constants/constraints.dart';
import 'package:dulich/constants/string.dart';
import 'package:dulich/widgets/large_text.dart';
import 'package:dulich/widgets/normal_text.dart';
import 'package:dulich/widgets/rect_button.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var ratedStar = 3;
  var indexPeople = 0;
  var liked = false;
  final scrollController = ScrollController();
  final max = 270;
  double topOffest = 270;
  double last = 0;
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      print("@@@@@@@@@@@@@$scrollController.offset@@@@@@@@@");
      var inRange = scrollController.offset <= 150;
      var rateChanged = (scrollController.offset / 150) * max;
      var changed = max - rateChanged;
      if (inRange) {
        if (changed >= 100) {
          if (last < scrollController.offset) {
            // scroll up
            setState(() {
              topOffest = changed;
            });
            print(
                "!!!!!!UP: take $rateChanged and change $changed from $topOffest!");
          } else {
            // down
            setState(() {
              topOffest = changed;
            });
            print("#######DOWN: take $rateChanged and change $changed");
          }
        }
      }
      last = scrollController.offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 300,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("img/mountain.jpeg"))),
                )),
            Positioned(
                left: 20,
                top: 50,
                right: 20,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.menu,
                          color: AppColors.white,
                        )),
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert,
                          color: AppColors.white,
                        )),
                  ],
                )),
            Positioned(
                top: topOffest,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height - topOffest,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: AppColors.white),
                  child: ListView(
                      controller: scrollController,
                      shrinkWrap: true,
                      children: [
                        Row(
                          children: [
                            LargeText("Yosemite"),
                            const Spacer(),
                            LargeText(
                              "\$250",
                              color: AppColors.main,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_pin,
                              color: AppColors.main,
                            ),
                            NormalText("USA, California")
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          children: List.generate(5, (indxex) {
                            return Icon(
                              Icons.star,
                              color: indxex < ratedStar
                                  ? AppColors.star
                                  : AppColors.gray,
                            );
                          }),
                        ), //star
                        const SizedBox(
                          height: 20,
                        ),
                        LargeText("People"),
                        NormalText(
                          "Nummber of people in your group",
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          height: 50,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: ((context, index) {
                                return Container(
                                  margin: AppConstraints.mx(5),
                                  child: RectButton(
                                    borderColor: index == indexPeople
                                        ? AppColors.main
                                        : AppColors.lightGray,
                                    backgroundColor: index == indexPeople
                                        ? AppColors.main
                                        : AppColors.lightGray,
                                    minimumSize: const Size(50, 50),
                                    onPressed: () {
                                      setState(() {
                                        indexPeople = index;
                                      });
                                    },
                                    child: Center(
                                      child: NormalText(
                                        "${index + 1}",
                                        color: index == indexPeople
                                            ? AppColors.white
                                            : AppColors.gray,
                                      ),
                                    ),
                                  ),
                                );
                              })),
                        ),
                        LargeText(Strings.description),
                        NormalText(
                            "Deserunt nisi ea et sint. Ipsum aliqua eiusmod reprehenderit velit id mollit cupidatat reprehenderit nostrud id. Ad amet ullamco dolor amet occaecat reprehenderit tempor laborum. Et consequat pariatur commodo in Lorem est aliquip ut exercitation ad ut ullamco anim enim. Cillum occaecat mollit nostrud elit excepteur incididunt Lorem.Qui anim proident labore in laborum nulla enim nisi Lorem minim ea aliquip enim. Commodo cillum proident aliqua esse amet. Ea adipisicing dolore qui reprehenderit. Lorem do consequat esse sit ad magna quis cupidatat pariatur dolor aliquip laboris duis. Ea fugiat tempor reprehenderit est aliqua veniam in eu ullamco in cillum nostrud officia deserunt. Consequat veniam nulla tempor sit mollit ipsum exercitation cillum pariatur cupidatat veniam non aliqua. Ut reprehenderit ullamco do commodo occaecat est id culpa consequat labore exercitation tempor.Ex incididunt sunt sunt sunt occaecat proident sunt cupidatat sunt ex reprehenderit. Duis enim ex duis dolor eiusmod veniam ea laborum. Commodo enim est magna culpa. Ut amet commodo ut exercitation cupidatat do excepteur tempor esse ea.Sit cillum sint ipsum Lorem qui aliquip consequat. Non dolor labore labore fugiat quis elit amet consectetur et fugiat proident laborum. Anim ad cillum incididunt consectetur reprehenderit sit ex ad laboris consectetur culpa. Mollit ut aute anim velit. Aliquip qui anim reprehenderit fugiat fugiat consequat amet esse eu sit. Ea eiusmod ad laborum tempor veniam dolore reprehenderit veniam. Minim id proident sint nisi anim sit exercitation est esse excepteur veniam in nisi labore.Et proident tempor mollit excepteur dolore incididunt magna enim eu irure incididunt esse magna. Velit qui culpa ea incididunt laboris reprehenderit tempor aute voluptate nulla. Deserunt mollit amet quis eiusmod velit esse. Laboris duis cillum sit voluptate ea excepteur quis ullamco veniam ut. Aute officia veniam officia exercitation. Est nulla amet et veniam. Voluptate ipsum non ut aliqua aute ad aliqua.Aliquip dolor duis sunt commodo velit consectetur aliquip veniam in do ipsum id consectetur. Nulla sunt Lorem est incididunt veniam minim proident. Officia ea dolor nostrud sit cillum. Laboris exercitation eiusmod elit exercitation tempor excepteur nulla enim fugiat magna amet qui. Anim deserunt ad laboris consequat velit voluptate fugiat pariatur ut adipisicing.Officia incididunt eiusmod dolor occaecat proident elit consectetur nisi est tempor enim aute sint et. Consequat voluptate mollit in aliquip et veniam cupidatat ex ut exercitation et. Veniam Lorem culpa non Lorem ex duis enim in consectetur quis. Amet ea est elit commodo aute esse cillum eiusmod irure velit. Occaecat ex dolore ut sint reprehenderit anim. Enim sunt ad nisi dolor do magna amet adipisicing. Occaecat ipsum laborum nulla consectetur aliquip duis reprehenderit aliqua ut reprehenderit proident velit consequat ad. Cupidatat non tempor non sunt fugiat cupidatat officia eu laboris nisi reprehenderit cupidatat ut. Lorem qui ad consectetur non exercitation. Lorem consectetur incididunt ad ad Lorem mollit nulla ipsum adipisicing elit voluptate ea in aute. Excepteur irure est do elit ea anim non. Commodo irure officia culpa nulla. Anim reprehenderit aliquip esse nostrud culpa ullamco quis quis et ad. Aliqua anim culpa laborum esse excepteur velit eu mollit dolor et. Adipisicing sit sint commodo ad incididunt nisi ullamco sint enim dolor. Culpa amet incididunt eu sunt fugiat reprehenderit deserunt pariatur cillum sint laborum voluptate. Amet officia esse ad et. Nostrud qui quis culpa nostrud deserunt ipsum sint incididunt occaecat. Laborum laboris irure Lorem fugiat dolore exercitation labore velit. Incididunt dolore ea aute ipsum. Sunt proident consectetur nostrud laboris esse consectetur in nisi amet cupidatat veniam cillum occaecat.Reprehenderit laborum nostrud non sunt velit duis. Excepteur sint sunt deserunt ex non sunt deserunt cillum minim veniam eiusmod. Veniam fugiat elit nulla deserunt tempor cupidatat ex laborum. Consectetur exercitation pariatur cupidatat eu ut culpa esse dolore et cupidatat aute. Irure Lorem velit laborum aliquip et amet fugiat reprehenderit est dolor labore sit ex. Proident nisi incididunt laboris nulla.")
                      ]),
                ))
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.only(
            left: 20, right: 20, bottom: MediaQuery.of(context).padding.bottom),
        child: Row(children: [
          RectButton(
            backgroundColor: AppColors.white,
            fixedSize: const Size(50, 50),
            borderColor: liked ? AppColors.red : AppColors.text2,
            onPressed: () {
              setState(() {
                liked = !liked;
              });
            },
            child: Icon(
              liked ? Icons.favorite : Icons.favorite_outline,
              color: liked ? AppColors.red : AppColors.text2,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Theme(
            data: ThemeData(splashColor: AppColors.white),
            child: Expanded(
                child: RectButton(
              onPressed: () {},
              minimumSize: const Size.fromHeight(50),
              child: Container(
                width: double.maxFinite,
                padding: AppConstraints.mx(20),
                child: Row(
                  children: [
                    NormalText(
                      Strings.bookTripNow,
                      size: 14,
                      color: AppColors.lightGray,
                      fontWeight: FontWeight.w700,
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.fast_forward,
                      color: AppColors.text1,
                    )
                  ],
                ),
              ),
            )),
          )
        ]),
      ),
    );
  }
}
