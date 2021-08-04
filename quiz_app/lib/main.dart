import 'package:flutter/material.dart';
import 'body_questions.dart';
import 'body_answer.dart';

void main() {
  runApp(App());
}

//Actual widget that create State object
class App extends StatefulWidget {
    @override
    AppState createState() => AppState();  
}

//State object associated with it can now contain data and return the widget tree
class AppState extends State<App>{
    int questionIdx = 0;
    bool showAnswers = false;

    final questions = [
        {
            'question':'What is the nature of you business needs?',
            'options': ['Time Tracking', 'Asset Management', 'Issue Tracking']
        },
        {
            'question': 'What is the expected size of the user base?',
            'options': ['Less than 1,000', 'Less than 10,000', 'More than 10,000']
        },
        {
            'question': 'In which region would the majority of the user base be?',
            'options': ['Asia', 'Europe', 'Americas', 'Africa', 'Middle East']
        },
        {
            'question': 'What is the expected project duration?',
            'options': ['Less than 3 months', '3-6 months', '6-9 months', 'More than 12 months']
        }
    ];

    var answers = [];

    void nextQuestion(String? answer) {
        answers.add({
            'question': questions[questionIdx]['question'],
            'answer':(answer==null)? '': answer
        });
        print(answer);

        if(questionIdx < questions.length - 1){
            setState(() => questionIdx++);
        } else {
            setState(() => showAnswers = true);
        }
    }

    @override
    Widget build(BuildContext context) {
        
        var bodyQuestions = BodyQuestions(questions: questions, questionIdx: questionIdx, nextQuestion: nextQuestion);
        var bodyAnswers = BodyAnswers(answers: answers);


        Scaffold homepage = Scaffold(
            appBar: AppBar(
                title: Text('Quiz'),
                backgroundColor: Colors.green,
            ),
            body: (showAnswers) ? bodyAnswers : bodyQuestions
        );
        return MaterialApp(
            home: homepage
        );
    }
  
}
