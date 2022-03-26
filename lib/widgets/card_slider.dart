import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'balance_card.dart';

class CardSlider extends StatelessWidget {
  final List balanceCards;
  const CardSlider({ Key? key, required this.balanceCards }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          // enlargeCenterPage: true,
          disableCenter: true,
          height: 150,
          viewportFraction: 1,
        ),
        items: balanceCards.map((item) {
          return Builder(
            builder: (BuildContext context) {
              return BalanceCard(cardData: item);
            },
          );
        }).toList());
  }
}

