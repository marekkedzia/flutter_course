import 'package:flutter/material.dart';

const logoFilePath = "assets/images/quiz-logo.png";

class LandingPage extends StatelessWidget {
  const LandingPage(this.handlePressed, {Key? key}) : super(key: key);

  final defaultColor = const Color.fromARGB(200, 255, 255, 255);
  final void Function() handlePressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80.0),
        Image.asset(
          logoFilePath,
          color: defaultColor,
        ),
        const SizedBox(height: 30.0),
        OutlinedButton.icon(
          onPressed: () {
            handlePressed();
          },
          style: OutlinedButton.styleFrom(foregroundColor: defaultColor),
          icon: const Icon(Icons.play_arrow),
          label: const Text(
            "Rozpocznij naukę!",
            style: TextStyle(fontSize: 28.0),
          ),
        )
      ],
    );
  }
}
