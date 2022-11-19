
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class DesktopScaffold extends StatefulWidget {
  DesktopScaffold({Key? key}) : super(key: key);

  @override
  State<DesktopScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<DesktopScaffold> {
  CarouselController carouselController = CarouselController();
  PageController pageController = PageController();
  int index = 0;
  bool mouseHover = false;
  var transform = Matrix4.identity()..translate(0, -5, 0);
  int forHover = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // pageController.addListener(() {
    //   Future.delayed(Duration(seconds: 3), () {
    //     print("q212121");
    //     pageController.animateTo(pageController.page!.toInt() + 1,
    //         duration: Duration(seconds: 2), curve: Curves.fastOutSlowIn);
    //     setState(() {});
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        height: 70,
        decoration: BoxDecoration(border: Border.all(color: Colors.grey[300]!)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            InkWell(
              child: Container(
                width: 190,
                decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: Colors.grey[300]!)),
                ),
                child: Center(
                  child: Image.asset(
                    'sheff_tj_logo.png',
                    fit: BoxFit.cover,
                    width: 130,
                  ),
                ),
              ),
            ),
            Row(children: [
              const SizedBox(width: 10),
              IconButton(
                  hoverColor: Colors.transparent,
                  onPressed: () => [],
                  icon: const Icon(
                    Icons.location_on_sharp,
                    size: 20,
                  )),
              const Text('Укажите адресс доставки')
            ]),
          ]),
          Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: 190,
                decoration: BoxDecoration(
                  border: Border(left: BorderSide(color: Colors.grey[300]!)),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.search),
                      SizedBox(width: 10),
                      Text("Поиск")
                    ]),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: 190,
                decoration: BoxDecoration(
                  border: Border(left: BorderSide(color: Colors.grey[300]!)),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.person),
                      SizedBox(width: 10),
                      Text("Войти")
                    ]),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: 190,
                decoration: BoxDecoration(
                  color: HexColor('#ee3b39'),
                  border: Border(left: BorderSide(color: Colors.grey[300]!)),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Корзина",
                        style: TextStyle(color: Colors.white),
                      )
                    ]),
              ),
            ],
          )
        ]),
      ),
      Expanded(
        child: Row(children: [
          Expanded(child: Container()),
          SizedBox(
              width: 1100,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ListView(children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: HexColor("00C000"),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "Заказов сегодня: 120",
                            style: GoogleFonts.acme(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CarouselSlider.builder(
                    carouselController: carouselController,
                    options: CarouselOptions(
                      height: 300,
                      viewportFraction: 0.75,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 4),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 1500),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                    ),
                    itemCount: imageAssets.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        index = itemIndex;
                        setState(() {});
                      });
                      return MouseRegion(
                        onEnter: (v) => setState(() {
                          mouseHover = true;
                          forHover = itemIndex;
                          print("hover : $forHover ; item : $itemIndex");
                        }),
                        onExit: (v) => setState(() {
                          mouseHover = false;
                        }),
                        child: AnimatedContainer(
                          transform: mouseHover == true && forHover == itemIndex
                              ? transform
                              : Matrix4.identity(),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          duration: const Duration(milliseconds: 200),
                          child: Image.asset(
                            imageAssets[itemIndex],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    DotsIndicator(
                      onTap: (v) {
                        print(v);
                        carouselController.animateToPage(v.toInt() - 1);
                        setState(() {});
                      },
                      dotsCount: imageAssets.length,
                      position: index.toDouble(),
                      decorator: DotsDecorator(
                        color: Colors.grey[300]!, // Inactive color
                        activeColor: Colors.grey,
                      ),
                    )
                  ]),
                  const SizedBox(height: 30),
                  Row(children: [
                    Text('Рестораны',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold, fontSize: 45)),
                    const SizedBox(width: 15),
                    Text('Магазины',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold, fontSize: 45)),
                    const SizedBox(width: 15),
                    Text('Акции',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold, fontSize: 45)),
                  ]),
                  ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          width: 100,
                          decoration: const BoxDecoration(color: Colors.amber),
                        );
                      })
                ]),
              )),
          Expanded(child: Container())
        ]),
      ),
    ]));
  }

  List<String> imageAssets = [
    'second_image.png',
    'third_image.png',
    'first_image.png'
  ];
}
