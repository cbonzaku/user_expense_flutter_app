import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:user_expense/widget/transaction_list.dart';
import 'models/transaction.dart';
import 'widget/transaction_list.dart';
import 'widget/transaction_input.dart';
import 'widget/chart.dart';

void main() {
  runApp(UserExpenseApp());
}

class UserExpenseApp extends StatefulWidget {
  @override
  State<UserExpenseApp> createState() => _UserExpenseAppState();
}

class _UserExpenseAppState extends State<UserExpenseApp> {
  //late String titleInput;
  final List<Transaction> transactionList = [
    Transaction(
        amount: 22222.99, date: DateTime.now(), id: "1", title: 'first one'),
    Transaction(amount: 5, date: DateTime.now(), id: "2", title: 'kkk'),
    Transaction(amount: 5, date: DateTime.now(), id: "3", title: 'kkk'),
    Transaction(amount: 5, date: DateTime.now(), id: "4 ", title: 'kkk'),
  ];

  void addTransaction(String title, double amount) {
    Transaction newTx = Transaction(
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString(),
        title: title);
    setState(() {
      transactionList.add(newTx);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return TransactionInput(addTransaction);
        });
  }

  void deleteTransaction(String id) {
    setState(() {
      transactionList.removeWhere((element) => element.id==id );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
        ),
        home: Builder(builder: (context) {
          return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () => startAddNewTransaction(context),
                      icon: Icon(Icons.add))
                ],
              ),
              body: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      child: Chart(transactionList),
                    ),
                  ),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                          padding: EdgeInsets.all(20),
                          child: TransactionList(transactionList,deleteTransaction))),
                ],
              ));
        }));
  }
}
