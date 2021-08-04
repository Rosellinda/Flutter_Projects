import 'package:flutter/material.dart';
import 'answer_button.dart';

class BodyQuestions extends StatelessWidget {
    final questions;
    final int questionIdx;
    final Function nextQuestion;

    BodyQuestions({
        required this.questions,
        required this.questionIdx,
        required this.nextQuestion
    });
    
    @override
    Widget build(BuildContext context) {
        Widget questionText = Text(
            questions[questionIdx]['question'].toString(),
            style: TextStyle(
                fontSize: 24.0
            )
        );

        var options = questions[questionIdx]['options'] as List<String>;
        var answerOptions = options.map((String option) {
            return AnswerButton(text: option, nextQuestion: nextQuestion);
        });

        return Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    questionText,
                    ...answerOptions,
                    Container(
                        width: double.infinity,
                        child: ElevatedButton(
                            child: Text('Skip Question'),
                            onPressed: () => nextQuestion(null),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green
                            )
                        )
                    )
                ]
            )
        );
    }
}

