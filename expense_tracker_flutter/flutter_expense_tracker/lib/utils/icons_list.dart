import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppIcons {
  final List<Map<String, dynamic>> homeExpensesCategories = [
    {
      "name": "Gas Filling",
      "icon": FontAwesomeIcons.gasPump,
    },
    {
      "name": "Food",
      "icon": FontAwesomeIcons.bowlFood,
    },
    {
      "name": "Shopping",
      "icon": FontAwesomeIcons.bagShopping,
    },
    {
      "name": "bill",
      "icon": FontAwesomeIcons.moneyBill,
    },
    {
      "name": "travel",
      "icon": FontAwesomeIcons.briefcase,
    },
    {
      "name": "home",
      "icon": FontAwesomeIcons.house,
    },
    {"name": "Others", "icon": FontAwesomeIcons.poo},
  ];

  IconData getExpenseCategoryIcons(String categoryNAme) {
    final category = homeExpensesCategories.firstWhere(
        (category) => category["name"] == categoryNAme,
        orElse: () => {"icon": FontAwesomeIcons.bagShopping});
    return category["icon"];
  }
}
