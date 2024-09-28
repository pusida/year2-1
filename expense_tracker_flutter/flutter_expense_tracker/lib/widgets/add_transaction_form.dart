import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/colors.dart';
import 'package:flutter_expense_tracker/utils/appvalidator.dart';
import 'package:flutter_expense_tracker/widgets/category_dropdown.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

class AddTransactionForm extends StatefulWidget {
  const AddTransactionForm({super.key});

  @override
  State<AddTransactionForm> createState() => _AddTransactionFormState();
}

class _AddTransactionFormState extends State<AddTransactionForm> {
  var type = "Income";
  var category = "Others";
  var isLoader = false;
  var appvalidator = Appvalidator();
  var amountEditController = TextEditingController();
  var titleEditController = TextEditingController();
  var uid = Uuid();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoader = true;
      });
      final user = FirebaseAuth.instance.currentUser;
      int timestamp = DateTime.now().millisecondsSinceEpoch;
      var amount = int.parse(amountEditController.text);
      DateTime date = DateTime.now();

      var id = uid.v4();
      String monthyear = DateFormat('MMM y').format(date);

      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .get();
      int remainingAmount = userDoc['remainingAmount'];
      int totalExpenses = userDoc['totalExpenses'];
      int totalIncome = userDoc['totalIncome'];
      if (type == 'Income') {
        remainingAmount += amount;
        totalIncome += amount;
      } else {
        remainingAmount -= amount;
        totalExpenses += amount;
      }
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .update({
        'remainingAmount': remainingAmount,
        'totalIncome': totalIncome,
        'totalExpenses': totalExpenses,
        'updatedAt': timestamp,
      });
      var data = {
        "id": id,
        "title": titleEditController.text,
        "amount": amount,
        "type": type,
        "category": category,
        "monthyear": monthyear,
        "timestamp": timestamp,
        "remainingAmount": remainingAmount,
        "totalIncome": totalIncome,
        "totalExpenses": totalExpenses,
      };
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection("transactions")
          .doc(id)
          .set(data);

      Navigator.pop(context);

      // await AuthService().login(data, context);
      setState(() {
        isLoader = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 0),
              decoration: BoxDecoration(
                color: secondary,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.03),
                    spreadRadius: 10,
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20, top: 15, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Title",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: const Color.fromARGB(255, 48, 40, 40)),
                    ),
                    TextFormField(
                      controller: titleEditController,
                      validator: appvalidator.isEmptyCheck,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      cursorColor: black,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: black),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Title",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 0),
              decoration: BoxDecoration(
                color: secondary,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.03),
                    spreadRadius: 10,
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20, top: 15, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Amount",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: const Color.fromARGB(255, 48, 40, 40)),
                    ),
                    TextFormField(
                      controller: amountEditController,
                      validator: appvalidator.isEmptyCheck,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      cursorColor: black,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: black),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Amount",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: mainFontColor,
                  width: 1.2,
                ),
              ),
              child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  value: 'Income',
                  items: [
                    DropdownMenuItem(
                      child: Text(
                        "Income",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w100,
                          color: mainFontColor,
                        ),
                      ),
                      value: 'Income',
                    ),
                    DropdownMenuItem(
                      child: Text(
                        "Expenses",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w100,
                          color: mainFontColor,
                        ),
                      ),
                      value: 'Expenses',
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        type = value;
                      });
                    }
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: mainFontColor,
                  width: 1.2,
                ),
              ),
              child: CategoryDropdown(
                  cattype: category,
                  onChanged: (String? value) {
                    if (value != null) {
                      setState(() {
                        category = value;
                      });
                    }
                  }),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  if (isLoader == false) {
                    _submitForm();
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 95, 38, 33),
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    )),
                child: isLoader
                    ? Center(
                        child: CircularProgressIndicator(
                        color: white,
                      ))
                    : Text(
                        "Add Transaction",
                        style: TextStyle(
                          color: white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ))
          ],
        ),
      ),
    );
  }
}
