import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_expense_tracker/colors.dart';
import 'package:flutter_expense_tracker/utils/pie_chart_list.dart';
import 'package:intl/intl.dart';

class PieChartToday extends StatefulWidget {
  final String userId;

  PieChartToday({
    super.key,
    required this.userId,
  });

  @override
  State<PieChartToday> createState() => _PieChartTodayState();
}

class _PieChartTodayState extends State<PieChartToday> {
  Map<String, double> categoryData = {};

  var colorchart = ColorChart();

  @override
  void initState() {
    super.initState();
  }

  Stream<Map<String, double>> _fetchData() async* {
    DateTime now = DateTime.now();
    DateTime startOfDay = DateTime(now.year, now.month, now.day, 0, 0, 0);
    DateTime endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

    yield* FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userId)
        .collection("transactions")
        .where('timestamp',
            isGreaterThanOrEqualTo: startOfDay.millisecondsSinceEpoch)
        .where('timestamp',
            isLessThanOrEqualTo: endOfDay.millisecondsSinceEpoch)
        .snapshots()
        .map((snapshot) {
      Map<String, double> tempData = {};
      for (var doc in snapshot.docs) {
        var data = doc.data() as Map<String, dynamic>;
        String category = data['category'];
        double amount = (data['amount'] as num).toDouble();
        String type = data['type'];

        if (type == "Expenses") {
          tempData[category] = (tempData[category] ?? 0) + amount;
        }
      }
      return tempData;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd MMM yyyy').format(now);
    return Scaffold(
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
            'Today\'s Expenses Pie Chart',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: mainFontColor),
          )),
      body: StreamBuilder<Map<String, double>>(
        stream: _fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
                child: Text('No transactions found.',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 255, 254, 254))));
          }

          categoryData = snapshot.data!;

          double totalAmount = categoryData.values.reduce((a, b) => a + b);

          var sortedCategoryData = categoryData.entries.map((entry) {
            double percentage = (entry.value / totalAmount) * 100;
            return MapEntry(entry.key, percentage);
          }).toList()
            ..sort((a, b) => b.value.compareTo(a.value));

          return Column(
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 30),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(129, 150, 44, 23),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.03),
                          spreadRadius: 10,
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.calendar_month_outlined,
                      size: 30,
                      color: const Color.fromARGB(255, 255, 253, 253),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    formattedDate,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Expanded(
                child: PieChart(
                  PieChartData(
                    sections: _getSections(totalAmount),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 110, vertical: 2),
                height: 35,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(140, 255, 254, 254),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Center(
                  child: Text('Category Data',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 0, 0, 0))),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: sortedCategoryData.length,
                  itemBuilder: (context, index) {
                    String category = sortedCategoryData[index].key;
                    double amount = categoryData[category]!;
                    Color categoryColor = categoryColors[category]!;

                    double percentage = (amount / totalAmount) * 100;

                    return Container(
                      margin: EdgeInsets.only(top: 15, left: 20, right: 20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(199, 255, 254, 254),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: grey.withOpacity(0.03),
                            spreadRadius: 10,
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: ListTile(
                        minVerticalPadding: 10,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        leading: Container(
                          width: 40,
                          height: 30,
                          decoration: BoxDecoration(
                            color: categoryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        title: Row(
                          children: [
                            Expanded(
                              child: Text('${category}',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: mainFontColor)),
                            ),
                            Expanded(
                              child: Text(
                                '฿${amount.toStringAsFixed(2)}  -${percentage.toStringAsFixed(1)}%',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: mainFontColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Map<String, Color> categoryColors = {};
  List<PieChartSectionData> _getSections(double totalAmount) {
    return categoryData.entries.map((entry) {
      double percentage = (entry.value / totalAmount) * 100;
      String title = percentage > 5 ? '${percentage.toStringAsFixed(1)}%' : '';
      Color sectionColor = colorchart.customColors[
          categoryData.keys.toList().indexOf(entry.key) %
              colorchart.customColors.length];
      categoryColors[entry.key] = sectionColor;
      return PieChartSectionData(
        color: sectionColor,
        value: entry.value,
        title: title,
        radius: 100,
        titleStyle:
            TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: white),
      );
    }).toList();
  }
}
