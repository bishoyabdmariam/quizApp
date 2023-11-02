import 'package:flutter/material.dart';
import 'package:untitled1/data/questions.dart';
import 'package:untitled1/question_screen.dart';
import 'package:untitled1/resultScreen.dart';
import 'package:untitled1/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? screen;
  List<String> selectedAnswers = [];

  @override
  void initState() {
    screen = StartScreen(changeScreen);
    super.initState();
  }

  void addAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        screen = ResultScreen(
          chosenAnswers: selectedAnswers,
          onRestart: restart,
        );
        selectedAnswers = [];
      });
    }
  }

  void restart() {
    setState(() {
      screen = StartScreen(changeScreen);
    });
  }

  void changeScreen() {
    setState(() {
      screen = QuestionScreen(addAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: Colors.purple,
        body: Container(
          child: screen,
        ),
      ),
    );
  }
}
