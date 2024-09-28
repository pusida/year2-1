import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/colors.dart';
import 'package:flutter_expense_tracker/utils/icons_list.dart';

class CategoryDropdown extends StatelessWidget {
  CategoryDropdown({super.key, this.cattype, required this.onChanged});
  final String? cattype;
  final ValueChanged<String?> onChanged;
  var appIcons = AppIcons();
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        underline: SizedBox(),
        value: cattype,
        isExpanded: true,
        hint: Text("Select Category"),
        items: appIcons.homeExpensesCategories
            .map((e) => DropdownMenuItem<String>(
                value: e['name'],
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Container(
                      height: 40,
                      width: 45,
                      decoration: BoxDecoration(
                        color: arrowbgColor,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Icon(
                        e['icon'],
                        color: const Color.fromARGB(255, 104, 52, 49),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      e['name'],
                      style: TextStyle(color: mainFontColor),
                    ),
                  ],
                )))
            .toList(),
        onChanged: onChanged);
  }
}
