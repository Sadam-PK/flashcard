import 'package:flashcard/country.dart';
import 'package:flashcard/custom_button.dart';
import 'package:flashcard/quiz.dart';
import 'package:flutter/material.dart';

class MyCountryApp extends StatefulWidget {
  const MyCountryApp({Key? key}) : super(key: key);

  @override
  State<MyCountryApp> createState() => _MyCountryAppState();
}

class _MyCountryAppState extends State<MyCountryApp> {
  Quiz quizScoreCard = Quiz();

  bool showAns = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text("Capital's Guess"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Score = ${quizScoreCard.currentScore}/${quizScoreCard.totalAttempts}",
            style: const TextStyle(fontSize: 25),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    showAns = !showAns;
                  });
                },
                child: Card(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        showAns ? 'Capital' : 'Country',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        showAns
                            ? countries[quizScoreCard.totalAttempts]['city']!
                            : countries[quizScoreCard.totalAttempts]
                                ['country']!,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'tap for toggle Country/Capital',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 13,
                        ),
                      ),
                      // Text("Capital City"),
                      // Text("Capital Name"),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  onPress: markAnswerCorrect,
                  title: "Correct",
                  backgroundColor: Colors.green,
                ),
                CustomButton(
                  onPress: markAnswerWrong,
                  title: "Wrong",
                  backgroundColor: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        onPressed: resetQuiz,
        child: const Text('Reset'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  resetQuiz() {
    setState(() {
      quizScoreCard.resetQuiz();
    });
  }

  void markAnswerCorrect() {
    setState(() {
      if (quizScoreCard.totalAttempts < countries.length - 1) {
        quizScoreCard.markAnswerCorrect();
        quizScoreCard.totalAttempts;
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Alert'),
                content: const Text('Limit Reached..'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("CANCEL"),
                  ),
                ],
              );
            });
      }
    });
  }

  void markAnswerWrong() {
    setState(() {
      if (quizScoreCard.totalAttempts < countries.length - 1) {
        quizScoreCard.markAnswerWrong();
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Alert'),
                content: const Text('Limit Reached..'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("CANCEL"),
                  ),
                ],
              );
            });
      }
    });
  }
}
