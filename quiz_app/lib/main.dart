import 'package:flutter/material.dart';

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

    void nextQuestion() {
        setState(() => questionIdx++);
    }

    @override
    Widget build(BuildContext context) {
        Widget questionText = Text(
            questions[questionIdx]['question'].toString(),
            style: TextStyle(
                fontSize: 24.0
            )
        );

        Container body = Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    questionText,
                    Container(
                        width: double.infinity,
                        child: ElevatedButton(
                            child: Text('Skip Question'),
                            onPressed: nextQuestion,
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green
                            )
                        )
                    )
                ]
            )
        );
        Scaffold homepage = Scaffold(
            appBar: AppBar(
                title: Text('Quiz'),
                backgroundColor: Colors.green,
            ),
            body: body
        );
        return MaterialApp(
            home: homepage
        );
    }
  
}
