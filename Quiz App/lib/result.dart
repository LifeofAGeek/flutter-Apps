import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function reset;
  Result(this.resultScore, this.reset);

  String get phrase {
    String outputText;
    if (resultScore <= 8) {
      outputText = "You're Awsome";
    } else if (resultScore <= 12) {
      outputText = "You're pretty likeable";
    } else {
      outputText = "You're okay okay!";
    }
    return outputText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            phrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(onPressed: reset, child: Text("Restart Quiz?"))
        ],
      ),
    );
  }
}
