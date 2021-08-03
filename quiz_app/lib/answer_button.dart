import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
    final String text;
    final Function nextQuestion;

    AnswerButton({
        this.text,
        this.nextQuestion
    });

    @override
    Widget build(BuildContext context) {
        return RadioListTile<String>(
            title: Text(text),
            value: text,
            groupValue: null,
            onChanged: (value) {
                Widget snackBar = SnackBar(
                    content: Text('You have selected $value'),
                    duration: Duration(milliseconds: 2000)
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                nextQuestion(value);
            }
        );
    }
}