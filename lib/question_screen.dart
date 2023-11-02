import 'package:flutter/material.dart';
import 'package:untitled1/answerButton.dart';
import 'package:untitled1/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.onSel, {super.key});

  final void Function(String answers) onSel;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[questionIndex];

    void switchQuestion(String selectedAnswer) {
      widget.onSel(selectedAnswer);

      setState(() {
        questionIndex++;
      });
    }

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.questionText,
              style: const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffeledAnswers().map(
                  (e) => AnswerButton(
                    text: e,
                    onTap: () {
                      switchQuestion(e);
                      print(e);
                    },
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
