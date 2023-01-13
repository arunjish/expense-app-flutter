import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addTx;

  NewTransaction({this.addTx});

  @override
  Widget build(BuildContext context) {
    void submit() {
      var enteredText = titleController.text;
      var enteredAmount = double.parse(amountController.text);
      if (enteredText.isEmpty || enteredAmount < 0) {
        return;
      }
      this.addTx(
        enteredText,
        enteredAmount,
      );
    }

    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (value) => submit(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              onSubmitted: (value) => submit(),
            ),
            TextButton(
                onPressed: submit,
                child: Text(
                  'Add Transaction',
                  style: TextStyle(
                    color: Colors.purple,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
