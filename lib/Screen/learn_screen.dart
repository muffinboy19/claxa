import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:gleo_x/Screen/Question/question1widget.dart';
import 'package:gleo_x/Screen/Question/question2widget.dart';
import 'package:gleo_x/Screen/Question/question3widget.dart';
import 'package:gleo_x/Screen/Question/question4widget.dart';
import 'package:gleo_x/Screen/Question/question5widget.dart';

class Example extends StatelessWidget {
  List<Widget> screens = [
    question1widget(),
    question2Widget(),
    quesition3widget(),
    question4widget(),
    question5widget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flexible(
        child: CardSwiper(
          cardsCount: screens.length,
          cardBuilder: (context, index, percentThresholdX, percentThresholdY) => screens[index],
        ),
      ),
    );
  }
}

