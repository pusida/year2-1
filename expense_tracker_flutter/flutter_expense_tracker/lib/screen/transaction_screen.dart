import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/widgets/category_list.dart';
import 'package:flutter_expense_tracker/widgets/tab_bar_view.dart';
import 'package:flutter_expense_tracker/widgets/time_line_month.dart';
import 'package:intl/intl.dart';

class TransactionScreen extends StatefulWidget {
  TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  var category = "All";
  var monthYear = "";

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    setState(() {
      monthYear = DateFormat('MMM Y').format(now);
    });
  }

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/back1.JPG'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(
            Icons.monetization_on_rounded,
            color: Color.fromARGB(201, 48, 40, 40),
            size: 25,
          ),
          centerTitle: true,
          title: Text(
            "Summery",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: const Color.fromARGB(255, 48, 40, 40)),
          ),
        ),
        body: Column(
          children: [
            TimeLineMonth(
              onchange: (String? value) {
                if (value != null) {
                  setState(() {
                    monthYear = value;
                  });
                }
              },
            ),
            SizedBox(height: 10),
            CategoryList(
              onchange: (String? value) {
                if (value != null) {
                  setState(() {
                    category = value;
                  });
                }
              },
            ),
            TypeTabBar(
              userId: userId,
              monthYear: monthYear,
              category: category,
            ),
          ],
        ),
      ),
    );
  }
}
