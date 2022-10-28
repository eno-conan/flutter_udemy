import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  //
  // String titleInput;
  // String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: const InputDecoration(labelText: 'Title'),
                  controller: titleController,
                  // onChanged: (val) {
                  //   titleInput = val;
                  // },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Amount'),
                  controller: amountController,
                  // onChanged: (val) {
                  //   amountInput = val;
                  // },
                ),
                TextButton(
                  onPressed: () {
                    print(titleController.text);
                    print(amountController.text);
                    // print(amountInput);
                  },
                  child: const Text(
                    'Add Trunsaction',
                    style: TextStyle(fontSize: 20, color: Colors.purple),
                  ),
                )
              ],
            )));
  }
}
