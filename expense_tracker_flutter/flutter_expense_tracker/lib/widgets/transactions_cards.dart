import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/colors.dart';
import 'package:flutter_expense_tracker/utils/icons_list.dart';
import 'package:flutter_expense_tracker/widgets/transaction_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TransactionsCard extends StatelessWidget {
  TransactionsCard({super.key, required this.userId});
  final String userId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          RecentTransactionsList(
            userId: userId,
          ),
        ],
      ),
    );
  }
}

class RecentTransactionsList extends StatelessWidget {
  RecentTransactionsList({super.key, required this.userId});
  final String userId;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection("transactions")
            .orderBy('timestamp', descending: true)
            .limit(20)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
                child: Text('No transaction found.',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 255, 254, 254))));
          }
          var data = snapshot.data!.docs;

          return ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var cardData = data[index];
                return TransactionCard(
                  data: cardData,
                );
              });
        });
  }
}
