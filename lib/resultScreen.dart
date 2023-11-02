import 'package:flutter/material.dart';
import 'package:untitled1/data/questions.dart';
import 'package:untitled1/question_summary.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {required this.chosenAnswers, required this.onRestart, super.key});

  final List<String> chosenAnswers;
  final Function() onRestart;
  int counter = 0;

  List<Map<String, Object>> getSummary() {
    counter = 0;
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosenAnswers.length; i++) {
      if (questions[i].answers[0] == chosenAnswers[i]) {
        counter++;
      }
      summary.add({
        "question_index": i,
        "question": questions[i].questionText,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final s = getSummary();
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You have answered $counter of ${chosenAnswers.length} correctly",
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData: s),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: onRestart,
              child: const Text("Restart the Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
