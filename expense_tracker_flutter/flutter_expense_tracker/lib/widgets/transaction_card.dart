import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/colors.dart';
import 'package:flutter_expense_tracker/utils/icons_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  TransactionCard({
    super.key,
    required this.data,
  });
  final dynamic data;

  var appIcons = AppIcons();
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(data['timestamp']);
    String formateData = DateFormat('d MMM hh:mma').format(date);
    return Container(
      margin: EdgeInsets.only(top: 15, left: 20, right: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(249, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
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
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        leading: Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 237, 217, 217),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
              child: FaIcon(
                  appIcons.getExpenseCategoryIcons('${data['category']}'))),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                "${data['title']}",
                style: TextStyle(
                  fontSize: 14,
                  color: black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "${data['type'] == 'Income' ? '+' : '-'} ฿${data['amount']}",
              style: TextStyle(
                fontSize: 15,
                color: data['type'] == 'Income'
                    ? green
                    : const Color.fromARGB(255, 163, 46, 38),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formateData,
              style: TextStyle(
                fontSize: 12,
                color: black,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
