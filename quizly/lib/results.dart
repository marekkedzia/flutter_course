import 'package:flutter/material.dart';
import 'package:quizly/data/questions.dart';
import 'package:quizly/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.choosenAnswers});

  final List<int> choosenAnswers;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        "questionIndex": i,
        "question": questions[i].content,
        "correctAnswer": questions[i].answers[questions[i].correctAnswer],
        "choosenAnswer": questions[i].answers[choosenAnswers[i]]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 30),
              const Text("Ukończyłeś quiz!",
                  style: TextStyle(fontSize: 30, color: Colors.white)),
              const SizedBox(height: 30),
              QuestionsSummary(getSummary()),
              const SizedBox(height: 30),
              TextButton(child: const Text("Restart"), onPressed: () {})
            ]),
          ),
        ));
  }
}
