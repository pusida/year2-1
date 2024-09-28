import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/colors.dart';
import 'package:flutter_expense_tracker/widgets/transaction_list.dart';

class TypeTabBar extends StatelessWidget {
  TypeTabBar(
      {super.key,
      required this.userId,
      required this.category,
      required this.monthYear});

  final String userId;
  final String category;
  final String monthYear;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                SizedBox(height: 15),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 94, 94, 94),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TabBar(
                      indicator: BoxDecoration(
                        color: const Color.fromARGB(186, 243, 97, 68),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      // indicatorColor: Colors.transparent,
                      // indicatorColor: const Color.fromARGB(
                      //     255, 46, 12, 199), // เปลี่ยนสีของ indicator
                      labelColor: const Color.fromARGB(
                          255, 96, 23, 23), // เปลี่ยนสีข้อความที่เลือก
                      // unselectedLabelColor: const Color.fromARGB(255, 20, 2, 2),
                      tabs: [
                        Tab(
                            child: Center(
                                child: Text(
                          "Income",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ))),
                        Tab(
                            child: Center(
                                child: Text(
                          "Expenses",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ))),
                      ]),
                ),
                Expanded(
                    child: TabBarView(children: [
                  TransactionList(
                      userId: userId,
                      category: category,
                      type: 'Income',
                      monthYear: monthYear),
                  TransactionList(
                      userId: userId,
                      category: category,
                      type: 'Expenses',
                      monthYear: monthYear)
                ]))
              ],
            )));
  }
}
