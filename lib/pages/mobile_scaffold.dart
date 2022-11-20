import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class MobileScaffold extends StatefulWidget {
  MobileScaffold({Key? key}) : super(key: key);

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  PageController pageController = PageController();
  CarouselController carouselController = CarouselController();
  int index = 0;
  int pageIndex = 0;
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      print(scrollController.offset);
      if (scrollController.offset > 200) return;
      if (mounted) {
        // if (pageIndex < 2) {
        //   pageIndex++;
        //   setState(() {});
        //   pageController.animateToPage(
        //     pageIndex,
        //     duration: const Duration(milliseconds: 350),
        //     curve: Curves.fastOutSlowIn,
        //   );
        // } else {
        //   pageIndex = 0;
        //   setState(() {});
        //   pageController.animateToPage(
        //     pageIndex,
        //     duration: const Duration(milliseconds: 350),
        //     curve: Curves.fastOutSlowIn,
        //   );
        // }
      }
    });
    scrollController.addListener(() {
      if (scrollController.offset < 120) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#ffffff'),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: HexColor('#f6f6f6')),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        "Укажите адресс доставки",
                        style: TextStyle(color: Colors.grey[700], fontSize: 13),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Row(children: [
                Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: HexColor('#f6f6f6')),
                    child: const Icon(
                      Icons.search,
                      size: 20,
                    )),
                const SizedBox(width: 10),
                Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: HexColor('#f6f6f6')),
                    child: const Icon(
                      Icons.favorite_outline,
                      size: 20,
                    )),
                const SizedBox(width: 10),
                Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: HexColor('#f6f6f6')),
                    child: const Icon(
                      Icons.person,
                      size: 20,
                    ))
              ])
            ]),
            const SizedBox(height: 20),
            Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'sheff_tj_logo.png',
                        width: 150,
                        height: 30,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: HexColor('00c000')),
                          child: const FittedBox(
                              fit: BoxFit.contain,
                              child: Center(
                                  child: Text(
                                "Заказов сегодня 120",
                                style: TextStyle(color: Colors.white),
                              ))),
                        ),
                      )
                    ]),
                const SizedBox(height: 10),
              ],
            ),
            Expanded(
                child: ListView(controller: scrollController, children: [
              const SizedBox(height: 20),
              CarouselSlider.builder(
                carouselController: carouselController,
                options: CarouselOptions(
                  height: 100,
                  viewportFraction: 0.85,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 4),
                  autoPlayAnimationDuration: const Duration(milliseconds: 1500),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                ),
                itemCount: imageAssets.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    pageIndex = itemIndex;
                    setState(() {});
                  });
                  return Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                      imageAssets[itemIndex],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
              const SizedBox(height: 15),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                DotsIndicator(
                  decorator: DotsDecorator(
                      color: Colors.grey[200]!, activeColor: Colors.grey[500]),
                  dotsCount: imageAssets.length,
                  onTap: (double i) => setState(() {
                    pageIndex = i.toInt();
                    pageController.animateToPage(
                      pageIndex,
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.fastOutSlowIn,
                    );
                  }),
                  position: pageIndex.toDouble(),
                )
              ]),
              const SizedBox(height: 15),
              Text('Рестораны',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold, fontSize: 30)),
              const SizedBox(height: 15),
              Container(
                  height: 50,
                  child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 10,
                          ),
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return Container(
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10)),
                        );
                      }))),
              const SizedBox(height: 20),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Container(
                        height: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13)),
                        child: Column(
                          children: [
                            Container(
                              height: 150,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(13),
                                      topRight: Radius.circular(13)),
                                  image: DecorationImage(
                                      image: AssetImage('food_image.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Southern Fried Chicken",
                                              style: GoogleFonts.roboto(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)),
                                          Row(children: [
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: HexColor('#f6f6f6'),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: const Text('45-55 мин'),
                                            ),
                                            const SizedBox(width: 10),
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: HexColor('#f6f6f6'),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Row(
                                                children: const [
                                                  FittedBox(
                                                      fit: BoxFit.contain,
                                                      child: Icon(Icons.star,
                                                          size: 17)),
                                                  FittedBox(
                                                      fit: BoxFit.contain,
                                                      child: Text('3.2'))
                                                ],
                                              ),
                                            )
                                          ])
                                        ]),
                                  ),
                                  Expanded(
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Image.asset(
                                        'logo.png',
                                        width: 100,
                                        height: 50,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemCount: 9)
            ]))
          ]),
        ));
  }

  List<String> imageAssets = [
    'second_image.png',
    'third_image.png',
    'first_image.png'
  ];
  List<BoxShadow> boxShadows = [
    BoxShadow(
        color: Colors.grey[300]!,
        blurRadius: 7,
        offset: const Offset(
          -3,
          5,
        )),
    BoxShadow(
        color: Colors.grey[300]!,
        blurRadius: 7,
        offset: const Offset(
          3,
          -2,
        ))
  ];
}
