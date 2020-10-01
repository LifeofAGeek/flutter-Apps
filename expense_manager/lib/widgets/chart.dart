import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTxs;

  Chart(this.recentTxs);

  List<Map<String, Object>> get groupedTxValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      var sum = 0.0;
      for (var i = 0; i < recentTxs.length; i++) {
        if (recentTxs[i].date.day == weekday.day &&
            recentTxs[i].date.month == weekday.month &&
            recentTxs[i].date.year == weekday.year) {
          sum += recentTxs[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekday).substring(0, 3),
        'amount': sum,
      };
    }).reversed.toList();
  }

  double get weeklyspending {
    return groupedTxValues.fold(
        0.0, (previousValue, element) => previousValue + element['amount']);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTxValues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  data['day'],
                  data['amount'],
                  weeklyspending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / weeklyspending,
                ),
              );
            }).toList(),
          ),
        ));
  }
}
