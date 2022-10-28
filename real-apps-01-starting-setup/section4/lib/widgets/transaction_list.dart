import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:section4/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
        return Card(
            child: Row(
          // Row and Column has children
          children: <Widget>[
            // Container can not have children but can have many options
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 2)),
              padding: const EdgeInsets.all(10),
              child: Text(
                // how to escape dollar mark
                '\$: ${tx.amount}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple),
              ),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    tx.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(DateFormat.yMMMd().format(tx.date),
                      style: const TextStyle(color: Colors.grey))
                ])
          ],
        ));
      }).toList(),
    );
  }
}
