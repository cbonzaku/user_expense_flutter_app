import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionInput extends StatefulWidget {
  Function addingTransaction;
  TransactionInput(this.addingTransaction);

  @override
  State<TransactionInput> createState() => _TransactionInputState();
}

class _TransactionInputState extends State<TransactionInput> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submit() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);
    if (title == null || amount < 0) {
      return;
    }
    widget.addingTransaction(title, amount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "title",
              ),
              controller: titleController,
              //onChanged: (val) {
              //  titleInput = val;
              //},
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              keyboardType: TextInputType.number,
              controller: amountController,
              onSubmitted: (_)=>submit(),
              // onChanged: (val) {
              //  amountInput = val;
              // },
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                "Add transaction",
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        ),
      )),
    );
  }
}
