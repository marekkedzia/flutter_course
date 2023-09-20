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
              Text(
                "Ukończyłeś quiz!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 4.0,
                      offset: const Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              QuestionsSummary(getSummary()),
              const SizedBox(height: 15),
              SizedBox(
                width: 275.0,
                child: TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10)),
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 141, 13, 13),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    shadowColor: MaterialStateProperty.all(Colors.black45),
                    elevation: MaterialStateProperty.all(5),
                  ),
                  child: const Text(
                    "Restart",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {},
                ),
              )
            ]),
          ),
        ));
  }
}
