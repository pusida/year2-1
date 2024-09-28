import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/colors.dart';
import 'package:flutter_expense_tracker/screen/daily_screen.dart';
import 'package:flutter_expense_tracker/screen/transaction_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  List<Widget> pages = [
    DailyScreen(),
    TransactionScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      body: getBody(),
      bottomNavigationBar: getFooter(),
      // floatingActionButton: SafeArea(
      //     child: SizedBox(
      //         // child: FloatingActionButton(
      //         //   onPressed: () {},
      //         //   child: Icon(
      //         //     Icons.add,
      //         //     size: 20,
      //         //   ),
      //         // ),
      //         )),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      CupertinoIcons.house_fill,
      CupertinoIcons.chart_bar_circle_fill,
      // CupertinoIcons.chart_pie
    ];
    return AnimatedBottomNavigationBar(
      onTap: (index) {
        setTabs(index);
      },
      backgroundColor: const Color.fromARGB(255, 70, 28, 28),
      icons: iconItems,
      splashColor: secondary,
      activeColor: const Color.fromARGB(223, 216, 114, 94),
      inactiveColor: const Color.fromARGB(255, 205, 197, 197).withOpacity(1.0),
      gapLocation: GapLocation.center,
      activeIndex: pageIndex,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 20,
      iconSize: 30,
      rightCornerRadius: 20,
      elevation: 2,
    );
  }

  setTabs(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
