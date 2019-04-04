import 'package:flutter/material.dart';

import 'package:intro_slider/intro_slider.dart';
import 'package:flutter_bloc_example/ui/login/login_screen.dart';

class IntroductionScreen extends StatefulWidget {

  IntroductionScreen({Key key});

  @override
  IntroductionScreenState createState() => IntroductionScreenState();
}

class IntroductionScreenState extends State<IntroductionScreen> {

  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "Title 1",
        maxLineTitle: 2,
        styleTitle: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
        heightImage: 300,
        description: "Description 1",
        pathImage: "assets/bg_introduction_page_01.png",
        backgroundColor: Color(0xff203152),
      ),
    );
    slides.add(
      new Slide(
        title: "Title 2",
        maxLineTitle: 2,
        styleTitle: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),
        heightImage: 250,
        description: "Description 2",
        pathImage: "assets/bg_introduction_page_02.png",
        backgroundColor: Color(0xfff5a623),
      ),
    );
    slides.add(
      new Slide(
        title: "Title 3",
        maxLineTitle: 2,
        styleTitle: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),
        heightImage: 250,
        description: "Description 3",
        pathImage: "assets/bg_introduction_page_03.png",
        backgroundColor: Color(0xff9932CC),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      shouldHideStatusBar: true,
      nameSkipBtn: "SALTAR",
      nameNextBtn: "SEGUIR",
      nameDoneBtn: "ACCEDER",
      onDonePress: () => goToLogin(context),
      onSkipPress: () => goToLogin(context),
    );
  }

  goToLogin(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }
}