import 'package:flutter/material.dart';
import 'package:my_wallet/data/json.dart';
import 'package:my_wallet/theme/colors.dart';
import 'package:my_wallet/widgets/avatar_image.dart';
import 'package:my_wallet/widgets/card_slider.dart';
import 'package:my_wallet/widgets/coin_card.dart';
import 'package:my_wallet/widgets/coin_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: appBgColor,
        body: Container(
      decoration: const BoxDecoration(
        color: primary,
        /*gradient: LinearGradient(
          // begin: Alignment.topLeft,
          // end: Alignment.bottomRight,
          // stops: [.0, .7],
          colors: [appBgColorPrimary, appBgColorSecondary],
        ),*/
      ),
      child: getBody(),
    ));
  }

  getBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Welcome",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text("Hero Crypto ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        )),
                  ],
                )),
                const AvatarImage(
                  name:"Hero Crypto",
                  isSVG: true,
                  width: 35,
                  height: 35,
                  radius: 10,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          // CardSlider(slides: slides),
          getBalanceCards(),
          const SizedBox(
            height: 25,
          ),
          Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: const Text(
                "Ideal for new investers",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )),
          const SizedBox(
            height: 15,
          ),
          getCoinCards(),
          const SizedBox(
            height: 20,
          ),
          Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: const Text(
                "Newly Launched",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )),
          const SizedBox(
            height: 15,
          ),
          getNewCoins(),
        ]),
      ),
    );
  }

  getBalanceCards() {
    return CardSlider(balanceCards: balanceCards);
    //Center(child: BalanceCard(cardData: balanceCards[0]));
  }

  getCoinCards() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 5, left: 15),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            coins.length, (index) => CoinCard(cardData: coins[index])),
      ),
    );
  }

  getNewCoins() {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
          children:
              List.generate(coins.length, (index) => CoinItem(coins[index]))),
    );
  }
}
