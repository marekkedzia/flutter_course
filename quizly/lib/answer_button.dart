import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, this.handlePressed, {Key? key})
      : super(key: key);

  final String answerText;
  final Function() handlePressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: handlePressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 107, 19, 19),
        minimumSize: const Size(250.0, 55.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Text(
        answerText,
        style: const TextStyle(fontSize: 23),
      ),
    );
  }
}
