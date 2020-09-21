import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function onpress;
  final String answerText;
  Answer(this.onpress, this.answerText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.black,
        onPressed: onpress,
        child: Text(answerText),
      ),
    );
  }
}
