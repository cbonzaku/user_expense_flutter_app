import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> L;
  final Function delete;
  TransactionList(this.L, this.delete);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: L.isEmpty
          ? Column(
              children: [
                Text(
                  "no transaction",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(Icons.abc)
              ],
            )
          : ListView(
              padding: EdgeInsets.all(5),
              shrinkWrap: true,
              clipBehavior: Clip.antiAlias,
              scrollDirection: Axis.vertical,
              children: L.map((e) {
                return Card(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  width: 4,
                                  color: Color.fromARGB(255, 44, 103, 233))),
                          margin: EdgeInsets.all(10),
                          child: FittedBox(
                            child: Text(
                              "${e.amount.toStringAsFixed(2)}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 16, 64, 167)),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.title.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${e.date}",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                          ],
                        ),
                        new Spacer(),
                        Container(
                          child: IconButton(
                              onPressed: () {
                                delete(e.id);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Color.fromARGB(255, 168, 12, 12),
                              )),
                        ),
                      ],
                    ),
                  ),
                  elevation: 5,
                );
              }).toList()),
    );
  }
}
