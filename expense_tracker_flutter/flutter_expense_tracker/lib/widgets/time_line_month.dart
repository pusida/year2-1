import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/colors.dart';
import 'package:intl/intl.dart';

class TimeLineMonth extends StatefulWidget {
  const TimeLineMonth({super.key, required this.onchange});
  final ValueChanged<String?> onchange;
  @override
  State<TimeLineMonth> createState() => _TimeLineMonthState();
}

class _TimeLineMonthState extends State<TimeLineMonth> {
  String currentMonth = "";
  List<String> months = [];
  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    for (int i = -18; i <= 0; i++) {
      months.add(
          DateFormat('MMM y').format(DateTime(now.year, now.month + i, 1)));
    }
    currentMonth = DateFormat('MMM y').format(now);
    Future.delayed(Duration(seconds: 1), () {
      scollToSelectedMonth();
    });
  }

  scollToSelectedMonth() {
    final selectedMonthIndex = months.indexOf(currentMonth);
    if (selectedMonthIndex != -1) {
      final scrollOffset = (selectedMonthIndex * 100.0) - 170;
      scrollController.animateTo(scrollOffset,
          duration: Duration(microseconds: 500), curve: Curves.ease);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView.builder(
        controller: scrollController,
        itemCount: months.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentMonth = months[index];
                widget.onchange(months[index]);
              });
              scollToSelectedMonth();
            },
            child: Container(
              width: 90,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: currentMonth == months[index]
                    ? const Color.fromARGB(221, 132, 59, 44)
                    : white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.03),
                    spreadRadius: 10,
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Center(
                  child: Text(
                months[index],
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: currentMonth == months[index]
                      ? const Color.fromARGB(255, 255, 248, 248)
                      : const Color.fromARGB(255, 58, 17, 17),
                ),
              )),
            ),
          );
        },
      ),
    );
  }
}
