import 'package:flutter/material.dart';
import 'package:my_wallet/theme/colors.dart';
import 'avatar_image.dart';

class CoinCard extends StatelessWidget {
  final cardData;
  
  const CoinCard({Key? key, required this.cardData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(15),
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: secondary.withOpacity(0.6),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AvatarImage(
                  name: cardData["image"],
                  isSVG: false,
                  width: 30,
                  height: 30,
                ),
               const SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: Text(
                  cardData["name"] + " " + cardData["name_abb"],
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                )),
              ],
            ),
           const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   const Text(
                      "Price",
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
                    ),
                   const SizedBox(
                      height: 3,
                    ),
                    Text(
                      cardData["price"],
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style:
                         const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(left: 3, right: 3),
                  decoration: BoxDecoration(
                      color: primary.withAlpha(40),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_drop_up_sharp, color: primary),
                      Text(
                        cardData["change"],
                        style: const TextStyle(fontSize: 10, color: primary),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
