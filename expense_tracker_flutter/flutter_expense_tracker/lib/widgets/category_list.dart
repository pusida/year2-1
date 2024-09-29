import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/colors.dart';
import 'package:flutter_expense_tracker/utils/icons_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key, required this.onchange});
  final ValueChanged<String?> onchange;
  @override
  State<CategoryList> createState() => _TimeLineMonthState();
}

class _TimeLineMonthState extends State<CategoryList> {
  String currentCategory = "";

  List<Map<String, dynamic>> categorylist = [];

  final scrollController = ScrollController();
  var appIcons = AppIcons();

  var addCat = {
    "name": "All",
    "icon": FontAwesomeIcons.cartPlus,
  };

  @override
  void initState() {
    super.initState();
    setState(() {
      categorylist = appIcons.homeExpensesCategories;
      categorylist.insert(0, addCat);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: ListView.builder(
        controller: scrollController,
        itemCount: categorylist.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var data = categorylist[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                currentCategory = data['name'];
                widget.onchange(data['name']);
              });
            },
            child: Container(
              margin: EdgeInsets.all(6),
              padding: EdgeInsets.only(left: 0, right: 10),
              decoration: BoxDecoration(
                color: currentCategory == data['name']
                    ? const Color.fromARGB(255, 122, 85, 85)
                    : white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.03),
                    spreadRadius: 10,
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Center(
                  child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: arrowbgColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(
                      data['icon'],
                      color: const Color.fromARGB(255, 104, 52, 49),
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    data['name'],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: currentCategory == data['name']
                          ? white
                          : mainFontColor,
                    ),
                  ),
                  SizedBox(width: 5),
                ],
              )),
            ),
          );
        },
      ),
    );
  }
}
