import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/colors.dart';
import 'package:flutter_expense_tracker/widgets/transaction_card.dart';

class TransactionList extends StatelessWidget {
  TransactionList(
      {super.key,
      required this.userId,
      required this.category,
      required this.type,
      required this.monthYear});
  final String userId;

  final String category;
  final String type;
  final String monthYear;

  @override
  Widget build(BuildContext context) {
    Query query = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection("transactions")
        .orderBy('timestamp', descending: true)
        .where('monthyear', isEqualTo: monthYear)
        .where('type', isEqualTo: type);

    if (category != 'All') {
      query = query.where('category', isEqualTo: category);
    }

    return FutureBuilder<QuerySnapshot>(
        future: query.limit(150).get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
                child: Text('Something went wrong',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 254, 254))));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
                    color: const Color.fromARGB(255, 54, 5, 5)));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
                child: Text(
              'No transaction found.',
              style: TextStyle(
                  fontSize: 16, color: Color.fromARGB(255, 255, 254, 254)),
            ));
          }
          var data = snapshot.data!.docs;

          return SingleChildScrollView(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var cardData = data[index];
                  return TransactionCard(
                    data: cardData,
                  );
                }),
          );
        });
  }
}
