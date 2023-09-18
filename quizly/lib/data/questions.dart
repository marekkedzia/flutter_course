import 'package:quizly/models/quiz_question.dart';

const questions = [
  QuizQuestion(
    content: "Czy Java i Javascript to to samo?",
    answers: ["Tak", "Nie", "Prawie", "Może"],
    correctAnswer: 0,
  ),
  QuizQuestion(
    content: "Czy Dart jest językiem programowania?",
    answers: ["Tak", "Nie", "Nie wiem", "Może"],
    correctAnswer: 0,
  ),
  QuizQuestion(
    content: "Czy Flutter jest frameworkiem?",
    answers: ["Tak", "Nie", "Nie wiem", "Może"],
    correctAnswer: 0,
  ),
  QuizQuestion(
    content: "Czy Javasript jest najlepszym językiem programowania?",
    answers: ["Tak", "Nie", "Nie wiem", "Oczywiście"],
    correctAnswer: 3,
  ),
  QuizQuestion(
    content: "Co to jest CORS?",
    answers: ["Framework", "Biblioteka", "Spytaj Rekina", "Nie wiem"],
    correctAnswer: 2,
  )
];
