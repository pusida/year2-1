import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/screen/daily_screen.dart';
import 'package:flutter_expense_tracker/screen/one_day_screen.dart';
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
    OneDayScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    return BottomNavigationBar(
      currentIndex: pageIndex,
      onTap: (index) {
        setTabs(index);
      },
      backgroundColor: const Color.fromARGB(255, 70, 28, 28),
      selectedItemColor: const Color.fromARGB(223, 216, 114, 94),
      unselectedItemColor:
          const Color.fromARGB(255, 205, 197, 197).withOpacity(1.0),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.house_fill),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.chart_bar_circle_fill),
          label: 'Summary',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.chart_pie_fill),
          label: 'Chart',
        ),
      ],
    );
  }

  setTabs(int index) {
    setState(() {
      pageIndex = index;
    });
  }
}
