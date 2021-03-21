import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class SinglePage {
  final String title, subTitle;

  SinglePage({@required this.title, @required this.subTitle});
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int pageNumber = 0;

  List<Widget> buildDotIndicator() {
    List<Widget> _list = [];
    for (int i = 0; i <= 2; i++) {
      _list.add(i == pageNumber
          ? indicator(isActive: true)
          : indicator(isActive: false));
    }
    return _list;
  }

  List<SinglePage> _pages = [
    SinglePage(
        title: "Plan your trip",
        subTitle:
            "Plan your trip, choose your destination. Pick the best place for your holiday"),
    SinglePage(
        title: "Select the date",
        subTitle:
            "Select the day, book your ticket. We give you the best price."),
    SinglePage(
        title: "Enjoy your trip",
        subTitle:
            "Enjoy your holiday! Don't forget to capture photos and share with the world.")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VStack([
        Expanded(
            child: VxSwiper.builder(
          itemCount: 3,
          height: context.screenHeight,
          viewportFraction: 1.0,
          enableInfiniteScroll: false,
          onPageChanged: (index) {
            setState(() {
              pageNumber = index;
            });
          },
          initialPage: 0,
          itemBuilder: (context, index) {
            return VStack(
              [
                VxCircle(
                  radius: 50,
                  backgroundColor: Vx.gray100,
                  child: Icon(Icons.image_outlined,
                      size: 48.0, color: Vx.coolGray400),
                )
                    .outerShadowSm
                    .box
                    .height(200.0)
                    .width(200.0)
                    .margin(EdgeInsets.only(bottom: 20.0))
                    .makeCentered(),
                _pages[pageNumber]
                    .title
                    .text
                    .letterSpacing(0.5)
                    .headline5(context)
                    .semiBold
                    .center
                    .size(28.0)
                    .coolGray800
                    .makeCentered()
                    .box
                    .py4
                    .width(context.screenWidth * .8)
                    .makeCentered(),
                _pages[pageNumber]
                    .subTitle
                    .text
                    .caption(context)
                    .size(16.0)
                    .center
                    .coolGray500
                    .makeCentered()
                    .box
                    .py4
                    .width(context.screenWidth * .8)
                    .makeCentered(),
              ],
              alignment: MainAxisAlignment.center,
            )
                .box
                .white
                .height(context.screenHeight)
                .width(context.screenWidth)
                .make();
          },
        )),
        VStack(
          [
            HStack(
              buildDotIndicator(),
              axisSize: MainAxisSize.max,
              alignment: MainAxisAlignment.center,
              crossAlignment: CrossAxisAlignment.center,
            ),
            HStack(
              [
                MaterialButton(
                        onPressed: () => null,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(width: 1, color: Vx.coolGray800)),
                        padding: EdgeInsets.symmetric(vertical: 14.0),
                        child: "Get Started"
                            .text
                            .center
                            .uppercase
                            .semiBold
                            .letterSpacing(0.5)
                            .size(16.0)
                            .coolGray800
                            .makeCentered())
                    .box
                    .width(context.screenWidth * 0.4)
                    .make(),
                MaterialButton(
                        onPressed: () => null,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(width: 1, color: Vx.coolGray800)),
                        padding: EdgeInsets.all(14.0),
                        color: Vx.coolGray800,
                        child: "Join Now"
                            .text
                            .center
                            .uppercase
                            .semiBold
                            .white
                            .letterSpacing(0.5)
                            .size(16.0)
                            .makeCentered())
                    .box
                    .width(context.screenWidth * 0.4)
                    .make()
              ],
              axisSize: MainAxisSize.max,
              alignment: MainAxisAlignment.spaceEvenly,
            )
          ],
          alignment: MainAxisAlignment.spaceEvenly,
        )
            .box
            .white
            .width(context.screenWidth)
            .height(context.screenHeight * .15)
            .p8
            .makeCentered()
      ]),
    );
  }

  Widget indicator({bool isActive}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: isActive ? 8.0 : 6.0,
      width: isActive ? 8.0 : 6.0,
      decoration: BoxDecoration(
        color: isActive ? Vx.coolGray800 : Vx.coolGray400,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
    );
  }
}
