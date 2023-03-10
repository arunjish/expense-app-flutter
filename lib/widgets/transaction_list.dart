import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList({this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: this.transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                )),
                padding: EdgeInsets.all(10),
                child: Text(
                  '\$${this.transactions[index].amount.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    this.transactions[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    DateFormat.yMMMd().format(this.transactions[index].date),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              )
            ],
          ));
        },
      ),
    );
  }
}
