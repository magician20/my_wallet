import 'package:flutter/material.dart';
import 'package:my_wallet/pages/home_page.dart';
import 'package:my_wallet/theme/colors.dart';
import 'package:my_wallet/widgets/bottombar_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        // gradient: LinearGradient(
        //   colors: [appBgColorPrimary, appBgColorSecondary],
        // ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: getBottomBar(),
          floatingActionButton: getHomeButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          body: getBarPage()),
    );
  }

  Widget getHomeButton() {
    return Container(
      margin: const EdgeInsets.only(top: 35),
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: inActiveIcon.withOpacity(.2),
        shape: BoxShape.circle,
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            activeTab = 2;
          });
        },
        child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: secondary,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.add,
              color: primary,
              size: 28,
            )),
      ),
    );
  }

  Widget getBottomBar() {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        color: secondary.withOpacity(0.5),
      ),
      child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = 0;
                });
              },
              child: BottomBarItem(Icons.home, "",
                  isActive: activeTab == 0, activeColor: primary),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = 1;
                });
              },
              child: BottomBarItem(Icons.insert_chart, "",
                  isActive: activeTab == 1, activeColor: primary),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = 2;
                });
              },
              child: BottomBarItem(Icons.brightness_1, "",
                  isActive: activeTab == 2, activeColor: primary),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = 3;
                });
              },
              child: BottomBarItem(Icons.account_balance_wallet, "",
                  isActive: activeTab == 3, activeColor: primary),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = 4;
                });
              },
              child: BottomBarItem(Icons.settings, "",
                  isActive: activeTab == 4, activeColor: primary),
            ),
          ])),
    );
  }

  Widget getBarPage() {
    return IndexedStack(
      index: activeTab,
      children: const <Widget>[
        HomePage(),
        Center(
          child: Text(
            "Analysis",
            style: TextStyle(fontSize: 35),
          ),
        ),
        Center(
          child: Text(
            "New",
            style: TextStyle(fontSize: 35),
          ),
        ),
        Center(
          child: Text(
            "Balance",
            style: TextStyle(fontSize: 35),
          ),
        ),
        Center(
          child: Text(
            "Setting",
            style: TextStyle(fontSize: 35),
          ),
        )
      ],
    );
  }
}
