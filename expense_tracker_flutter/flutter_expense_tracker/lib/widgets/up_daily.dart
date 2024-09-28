import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/colors.dart';

class UpDailyWidget extends StatelessWidget {
  UpDailyWidget({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final Stream<DocumentSnapshot> _usersStream =
        FirebaseFirestore.instance.collection('users').doc(userId).snapshots();
    return StreamBuilder<DocumentSnapshot>(
      stream: _usersStream,
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        var data = snapshot.data!.data() as Map<String, dynamic>;
        ;

        return Cards(data: data, size: size);
      },
    );
  }
}

class Cards extends StatelessWidget {
  const Cards({
    super.key,
    required this.size,
    required this.data,
  });
  final Map data;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, left: 25, right: 25, bottom: 10),
      decoration: BoxDecoration(
          color: const Color.fromARGB(210, 255, 255, 255),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                color: grey.withOpacity(0.03), spreadRadius: 10, blurRadius: 3)
          ]),
      child: Padding(
        padding: EdgeInsets.only(top: 20, bottom: 25, right: 20, left: 20),
        child: Column(
          children: [
            SizedBox(height: 15),
            Column(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("images/profile_cat.jpg"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(height: 15),
                Container(
                  width: (size.width - 40) * 0.6,
                  child: Column(
                    children: [
                      Text(
                        "${data['username']}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: mainFontColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Spend wisely",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: black,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "${data['totalIncome']}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 50, 99, 24),
                      ),
                    ),
                    Text(
                      "Income",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: black,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 0.5,
                  height: 40,
                  color: black.withOpacity(0.3),
                ),
                Column(
                  children: [
                    Text(
                      "${data['remainingAmount']}",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: mainFontColor,
                      ),
                    ),
                    Text(
                      "Total Balance",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: black,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 0.5,
                  height: 40,
                  color: black.withOpacity(0.3),
                ),
                Column(
                  children: [
                    Text(
                      "${data['totalExpenses']}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 123, 20, 12),
                      ),
                    ),
                    Text(
                      "Expenses",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
