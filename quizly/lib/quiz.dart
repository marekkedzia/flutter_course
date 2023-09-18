import 'package:flutter/material.dart';
import 'package:quizly/landing_page.dart';
import 'package:quizly/questions_screen.dart';
import 'package:quizly/data/questions.dart';
import 'package:quizly/results.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  final List<int> selectedAnwersIndexes = [];

  void chooseAnswer(int answerIndex) {
    selectedAnwersIndexes.add(answerIndex);

    if (selectedAnwersIndexes.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(choosenAnswers: selectedAnwersIndexes);
      });
    }
  }

  @override
  void initState() {
    activeScreen = LandingPage(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 177, 19, 8),
                Color.fromARGB(255, 108, 4, 4)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: activeScreen),
      ),
    );
  }
}
