import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizly/answer_button.dart';
import 'package:quizly/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    Key? key,
    required this.onSelectAnswer,
  }) : super(key: key);

  final void Function(int answerIndex) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(int answerIndex) {
    widget.onSelectAnswer(answerIndex);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.content,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: currentQuestion.answers.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10.0);
              },
              itemBuilder: (BuildContext context, int index) {
                final answer = currentQuestion.answers[index];
                return AnswerButton(answer, () => answerQuestion(index));
              },
            ),
          ],
        ),
      ),
    );
  }
}
