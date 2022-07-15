import 'package:flashcard/country.dart';
import 'package:flutter/material.dart';

class MyCountryApp extends StatefulWidget {
  MyCountryApp({Key? key}) : super(key: key);

  @override
  State<MyCountryApp> createState() => _MyCountryAppState();
}

class _MyCountryAppState extends State<MyCountryApp> {
  int score = 0;
  int attempts = 0;
  bool showAns = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text("Capital's Guess"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Score = $score/$attempts",
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
                          ? countries[attempts]['city']!
                          : countries[attempts]['country']!,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    // Text("Capital City"),
                    // Text("Capital Name"),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 200.0,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  showAns = !showAns;
                });
              },
              child: Text("Show ${showAns ? 'Question' : 'Answer'}"),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (attempts < countries.length - 1) {
                        score++;
                        attempts++;
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
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  child: const Text("Correct"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (attempts < countries.length - 1) {
                        attempts++;
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
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  child: const Text("Wrong"),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        child: const Text('Reset'),
        onPressed: () {
          setState(() {
            attempts = 0;
            score = 0;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
