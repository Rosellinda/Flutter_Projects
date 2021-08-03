import 'package:flutter/material.dart';

class BodyAnswers extends StatelessWidget {
    final answers;

    BodyAnswers({this.answers});

    @override
    Widget build(BuildContext context) {
        var answerTiles = answers.map((item){
            return ListTile(
                title: Text(item['question']),
                subtitle: Text(item['answer']),
            );
        });

        return Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: Column(
                children: [
                    ...answerTiles
                ],
            ),
        );
    }
}