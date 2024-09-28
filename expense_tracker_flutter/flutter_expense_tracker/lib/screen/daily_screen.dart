import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/colors.dart';
import 'package:flutter_expense_tracker/screen/login_screen.dart';
import 'package:flutter_expense_tracker/widgets/add_transaction_form.dart';
import 'package:flutter_expense_tracker/widgets/transactions_cards.dart';
import 'package:flutter_expense_tracker/widgets/up_daily.dart';

class DailyScreen extends StatefulWidget {
  DailyScreen({super.key});

  @override
  State<DailyScreen> createState() => _DailyScreenState();
}

class _DailyScreenState extends State<DailyScreen> {
  var isLogoutLoading = false;

  logOut() async {
    setState(() {
      isLogoutLoading = true;
    });
    await FirebaseAuth.instance.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );

    setState(() {
      isLogoutLoading = false;
    });
  }

  final userId = FirebaseAuth.instance.currentUser!.uid;
  // final userId = FirebaseAuth.instance.currentUser?.uid ?? '';

  _dialogBuilder(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: AddTransactionForm(),
          );
        });
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/back1.JPG'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: SafeArea(
              child: SizedBox(
            child: FloatingActionButton(
              backgroundColor: const Color.fromARGB(241, 207, 82, 57),
              onPressed: () {
                _dialogBuilder(context);
              },
              child: Icon(
                Icons.add,
                size: 20,
                color: const Color.fromARGB(255, 198, 198, 198),
              ),
            ),
          )),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                // Text(
                //   "User ID: $userId", // แสดงค่า userId บนหน้าจอ
                //   style: TextStyle(fontSize: 18),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          logOut();
                        },
                        icon: isLogoutLoading
                            ? CircularProgressIndicator()
                            : Icon(Icons.logout_outlined)),
                    SizedBox(
                      width: 15,
                    )
                  ],
                ),
                UpDailyWidget(
                  userId: userId,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Overview",
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: mainFontColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                TransactionsCard(
                  userId: userId,
                )
              ],
            ),
          ))),
    );
  }
}
    //  body: Padding(
    //         padding: EdgeInsets.only(top: 20, bottom: 25, right: 20, left: 20),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.end,
    //           children: [
    //             IconButton(
    //                 onPressed: () {
    //                   logOut();
    //                 },
    //                 icon: isLogoutLoading
    //                     ? CircularProgressIndicator()
    //                     : Icon(Icons.logout_outlined)),
    //             // UpDaily(),
    //             TransactionCard()
    //           ],
    //         ),
    //       ),
