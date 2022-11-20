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
  bool mouserHoverForGridview = false;
  var transform = Matrix4.identity()..translate(0, -5, 0);
  int forHover = 0;
  int indexOfGriview = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#ffffff'),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 70,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey[300]!)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    InkWell(
                      child: Container(
                        width: 190,
                        decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(color: Colors.grey[300]!)),
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
                          border: Border(
                              left: BorderSide(color: Colors.grey[300]!)),
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
                          border: Border(
                              left: BorderSide(color: Colors.grey[300]!)),
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
                          border: Border(
                              left: BorderSide(color: Colors.grey[300]!)),
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
                          WidgetsBinding.instance
                              .addPostFrameCallback((timeStamp) {
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
                              transform:
                                  mouseHover == true && forHover == itemIndex
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
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                      SizedBox(
                          height: 100,
                          child: ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(width: 10),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Container(
                                    width: 90,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        color: HexColor('#f6f6f6'),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Center(
                                      child: Text(
                                        'Шашлыки',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              );
                            },
                          )),
                      SizedBox(
                          height: 100,
                          child: ListView.builder(
                            shrinkWrap: false,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Container(
                                    width: 90,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        color: HexColor('#f6f6f6'),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Center(
                                      child: Text(
                                        'Шашлыки',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              );
                            },
                          )),
                      const SizedBox(height: 20),
                      GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 40,
                                  childAspectRatio: 1.4,
                                  mainAxisSpacing: 50),
                          itemCount: 9,
                          itemBuilder: (context, index) {
                            return MouseRegion(
                              onEnter: (v) => setState(() {
                                mouserHoverForGridview = true;
                                indexOfGriview = index;
                              }),
                              onExit: (v) => setState(() {
                                mouserHoverForGridview = false;
                              }),
                              child: AnimatedContainer(
                                transform: mouserHoverForGridview == true &&
                                        indexOfGriview == index
                                    ? transform
                                    : Matrix4.identity(),
                                duration: const Duration(milliseconds: 100),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: mouserHoverForGridview == true &&
                                            indexOfGriview == index
                                        ? boxShadows
                                        : [],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(children: [
                                  Container(
                                    height: 140,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image:
                                                AssetImage('food_image.jpg')),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                  ),
                                  Expanded(
                                    child: Row(children: [
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text("Southern Fried Chicken",
                                                  style: GoogleFonts.roboto(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20)),
                                              Row(children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          HexColor('#f6f6f6'),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child:
                                                      const Text('45-55 мин'),
                                                ),
                                                const SizedBox(width: 10),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          HexColor('#f6f6f6'),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Row(
                                                    children: const [
                                                      Icon(Icons.star,
                                                          size: 17),
                                                      Text('3.2')
                                                    ],
                                                  ),
                                                )
                                              ])
                                            ]),
                                      ),
                                      Image.asset(
                                        'logo.png',
                                        width: 100,
                                        height: 50,
                                      )
                                    ]),
                                  )
                                ]),
                              ),
                            );
                          }),
                      const SizedBox(height: 30),
                      Expanded(
                          child: Container(
                        height: 60,
                        color: HexColor('#54545a'),
                        child: const Center(
                          child: Text(
                            'Показать еще рестораны',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )),
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
