import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_presentation_croc/pages/home_page/slides/cons_and_pros.dart';
import 'package:flutter_presentation_croc/pages/home_page/slides/do_you_use_chrome.dart';
import 'package:flutter_presentation_croc/pages/home_page/slides/examples.dart';
import 'package:flutter_presentation_croc/pages/home_page/slides/flutter_for_croc.dart';

import 'package:flutter_presentation_croc/pages/home_page/slides/i_am_flutter.dart';
import 'package:flutter_presentation_croc/pages/home_page/slides/meduza.dart';
import 'package:flutter_presentation_croc/pages/home_page/slides/simple_text.dart';
import 'package:flutter_presentation_croc/pages/home_page/slides/supported_platforms.dart';
import 'package:flutter_presentation_croc/pages/home_page/slides/thanks.dart';
import 'package:flutter_presentation_croc/pages/home_page/slides/tinkoff_example.dart';
import 'package:flutter_presentation_croc/pages/home_page/slides/welcome.dart';
import 'package:flutter_presentation_croc/pages/home_page/slides/what_is_flutter/dart.dart';
import 'package:flutter_presentation_croc/pages/home_page/slides/what_is_flutter/declarative_way.dart';
import 'package:flutter_presentation_croc/pages/home_page/slides/what_is_flutter/material_and_cupertino.dart';
import 'package:flutter_presentation_croc/pages/home_page/slides/what_is_flutter/no_native.dart';
import 'package:flutter_presentation_croc/pages/home_page/slides/what_is_flutter/speed.dart';
import 'package:flutter_presentation_croc/pages/home_page/slides/who_am_i.dart';

import 'package:flutter_presentation_croc/widgets/bottom_bar.dart';
import 'package:flutter_presentation_croc/widgets/contacts_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BottomBarCarouselController carouselController;

  final slides = <Widget Function(double width, double height)>[
    (w, h) => WelcomeSlide(w, h),
    (w, h) => WhoAmISlide(w, h),
    (w, h) => TinkoffExampleSlide(w, h),
    (w, h) => SimpleTextSlide(w, h,
            title: Text(
              'Что такое Flutter?',
              style: TextStyle(color: Colors.white, fontSize: h / 12),
            ),
            subtitle: Text(
              'Флаттер - молодая, но очень многообещающая платформа',
              style: TextStyle(color: Colors.white70, fontSize: h / 20),
            ),
            gradient: [
              const Color.fromRGBO(37, 91, 149, 1),
              const Color(0xFF352884)
            ]),
    (w, h) => WhatIsFlutterDartSlide(w, h),
    (w, h) => SupportedPlatformsSlide(w, h),
    (w, h) => WhatIsFlutterNoNativeSlide(
          width: w,
          height: h,
        ),
    (w, h) => DoYouUseChromeSlide(w, h),
    (w, h) => SpeedSlide(width: w, height: h),
    (w, h) => MaterialAndCupertinoSlide(
          width: w,
          height: h,
        ),
    (w, h) => SimpleTextSlide(w, h,
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: 'А еще у нас есть ',),
                  TextSpan(text: 'hot-reload', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
                ],
                style: TextStyle(color: Colors.white, fontSize: h / 12),
              ),
            ),
            gradient: [
              const Color(0xFF45287b),
              const Color.fromRGBO(37, 91, 149, 1)
            ]),
    (w, h) => IAmFlutterSlide(w, h),
    (w, h) => DeclarativeWaySlide(w, h),
    (w, h) => SimpleTextSlide(w, h,
            title: Text(
              'Flutter - молодая платформа, но уже сейчас ей доверяют крупнейшие компании',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: h / 12),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Google', style: TextStyle(color: Colors.white70, fontSize: h / 18),), 
                  Text('Baidu', style: TextStyle(color: Colors.white70, fontSize: h / 18),),
                  Text('Ebay', style: TextStyle(color: Colors.white70, fontSize: h / 18),),
                  Text('Philips', style: TextStyle(color: Colors.white70, fontSize: h / 18),),
                ],
              ),
            ),
            gradient: [
              const Color(0xFF327682),
              const Color(0xFF352884)
            ]),
    // (w, h) => ExampleSlide(width: w, height: h, gradient: [const Color(0xFF352884), const Color(0xFF7e81d3),], data: [
    //   ExampleData('assets/images/google_ads.jpg', 'Google Ads', ''),
    //   ExampleData('assets/images/google_studia.jpg', 'Google Stadia', ""),
    // ], additionalLogo: Text('Google', style: TextStyle(fontSize: w / 20, color: Colors.white),),),
    // (w, h) => ExampleSlide(width: w, height: h, gradient: [const Color(0xFF7e81d3), const Color(0xFF3c8c8d),], data: [
    //   ExampleData('assets/images/baidu.jpg', 'Baidu', ''),
    //   ExampleData('assets/images/ebay.jpg', 'Ebay Motors', ""),
    //   ExampleData('assets/images/philips_hue.jpg', 'Philips', ""),
    // ], ),
    (w, h) => MeduzaSlide(width: w, height: h),
    (w, h) => FlutterForCrocSlide(width: w, height: h),
    (w, h) => ConsAndProsSlide(w, h),
    (w, h) => SimpleTextSlide(w, h,
            title: Text(
              'Что Flutter значит для меня?',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: h / 12),
            ),
            subtitle: Text(
              'Это платформа, которая сохранила мне много времени и сил',
              style: TextStyle(color: Colors.white70, fontSize: h / 18),
              textAlign: TextAlign.center,
            ),
            gradient: [
              const Color(0xFF532C67),
              const Color(0xFF352884)
            ]),
    (w, h) => ThanksSlide(w, h),
  ];

  @override
  void initState() {
    this.carouselController = BottomBarCarouselController(slides.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: RawKeyboardListener(
        autofocus: true,
        focusNode: FocusNode(
          canRequestFocus: true,
          onKey: (node, value) {
            if (value.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
              carouselController.previous();
              return true;
            }
            if (value.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
              carouselController.next();
              return true;
            }
            return false;
          },
        ),
        child: Column(
          children: [
            Expanded(
                child: CarouselSlider.builder(
              itemCount: slides.length,
              itemBuilder: (context, index) =>
                  slides[index](size.width, size.height),
              options: CarouselOptions(
                  viewportFraction: 1,
                  height: size.height - 50,
                  enableInfiniteScroll: false,
                  onPageChanged: carouselController.onPageChangedListener),
              carouselController: carouselController.carouselController,
            )),
            Container(
              height: 50,
              child: BottomBarWidget(
                carouselController,
                leftWidget: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ContactsWidget([
                    ContactData("Павел Кондратьев", icon: Icons.account_circle),
                    ContactData("PKondratev@croc.ru", icon: AntDesign.mail),
                    ContactData("@pavelgeme2", icon: AntDesign.instagram),
                    ContactData("@pkondratev",
                        icon: MaterialCommunityIcons.telegram),
                    ContactData("pavel.kondratev.pk",
                        icon: AntDesign.facebook_square)
                  ]),
                ),
                rightWidget: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    "CROC",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
