import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/widgets/pie_chart_one_day.dart';

class OneDayScreen extends StatelessWidget {
  const OneDayScreen({super.key});

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
        body: PieChartToday(userId: userId),
      ),
    );
  }
}
