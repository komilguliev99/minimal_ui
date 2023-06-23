import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:minimal_ui/utils/constants.dart';
import 'package:minimal_ui/utils/planets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [gradientStartColor, gradientEndColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.3, 0.7])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Explore',
                      style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 40,
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w900)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: DropdownButton(
                      items: const [
                        DropdownMenuItem(
                            child: Text('Solar System',
                                style: TextStyle(
                                    fontFamily: 'Avenir',
                                    fontSize: 24,
                                    color: Color(0x7cdbf1ff),
                                    fontWeight: FontWeight.w500)))
                      ],
                      onChanged: (value) {},
                      icon: const Icon(Icons.arrow_drop_down),
                      underline: const SizedBox(),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 580,
              width: MediaQuery.of(context).size.width - 64,
              child: CardSwiper(
                  padding: const EdgeInsets.only(left: 64),
                  cardBuilder: (context, idx) {
                    return Stack(
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 100,
                            ),
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32)),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 80,
                                    ),
                                    Text(
                                      planets[idx].name,
                                      style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 44,
                                          color: primaryTextColor,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      'Solar System',
                                      style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 23,
                                          color: primaryTextColor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 32,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Know more',
                                          style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 18,
                                              color: secondaryTextColor,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: secondaryTextColor,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Image.asset(
                            planets[idx].iconImage,
                            height: 250,
                          ),
                        )
                      ],
                    );
                  },
                  cardsCount: planets.length),
            )
          ],
        )),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(32),
          decoration: const BoxDecoration(
              color: Color(0xFF6751B5),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {}, icon: Image.asset('assets/menu_icon.png')),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/search_icon.png')),
              IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
            ],
          ),
        ),
      ),
    );
  }
}
