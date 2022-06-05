import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:user_expense/models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> L;
  List<Data> data = [
    Data('Jan', 35),
    Data('Feb', 28),
    Data('Mar', 34),
    Data('Apr', 32),
    Data('May', 40)
  ];

  Chart(this.L);

  get lastTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double _amount = 0.0;
      String _day = '';

      for (int i = 0; i < L.length; i++) {
        if (L[i].date.day == weekDay.day) {
          _amount = L[i].amount;
          _day = DateFormat.E().format(L[i].date);
        }
      }

      return Data(_day.toString(), _amount);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Builder(builder: (context) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: Card(
            elevation: 10,
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                title: ChartTitle(text: 'area'),
                series: <ChartSeries>[
                  AreaSeries<Data, String>(
                    opacity:0.5 ,
                    borderWidth: 4,
                    borderColor: Colors.blue,
                    dataSource: data,
                    xValueMapper: (Data d, _) => d.day,
                    yValueMapper: (Data d, _) => d.amount,
                  ),
                ]),
          ),
        );
      }),
    );
  }
}

class Data {
  final double amount;
  final String day;
  Data(this.day, this.amount);
}
