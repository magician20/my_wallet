import 'package:flutter/material.dart';
import 'package:my_wallet/theme/colors.dart';

class BalanceCard extends StatelessWidget {
   final cardData;
  
  const BalanceCard({Key? key, required this.cardData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        padding:const  EdgeInsets.all(20),
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
           color: secondary2.withOpacity(.5),
         /* gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.1, 0.9],
            colors: [
              primary.withOpacity(.4),
              primary.withOpacity(.7),
            ],
          ),*/
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Balance",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              cardData["balance"],
              maxLines: 1,
              overflow: TextOverflow.fade,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
                      "Monthly profit",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      cardData["profit"],
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(left: 3, right: 3),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_drop_up_sharp),
                      Text(
                        cardData["change"],
                        style: const TextStyle(
                          fontSize: 12,
                        ),
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
