import 'package:flutter/material.dart';
import 'package:section4/models/transaction.dart';
import 'package:section4/widgets/new_transaction.dart';
import 'package:section4/widgets/transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionStateState createState() => _UserTransactionStateState();
}

class _UserTransactionStateState extends State<UserTransactions> {
  final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'new Shoes',
      amount: 69.9,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'new Shoes',
      amount: 21.9,
      date: DateTime.now(),
    ),
  ];

  void _addTrasaction(String newTitle, double newAmount) {
    final newTr = Transaction(
        title: newTitle,
        amount: newAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransaction.add(newTr);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[NewTransaction(), TransactionList(_userTransaction)],
    );
  }
}
