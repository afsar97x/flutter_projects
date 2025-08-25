import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int questionIndex = 0;
  List<String> selectedAnswers = [];

  // Info: to access function from the stateful class, use the widget property
  // example, if the stateful widget has a function func
  // you can call it using widget.func()
  void startOver() {
    setState(() {
      questionIndex = 0;
      selectedAnswers = [];
    });
  }

  void moveToNextQuestion({answer}) {
    if (questionIndex >= questions.length - 1) {
      setState(() {
        selectedAnswers.add(answer);

        questionIndex =
            -1; // Reset to the first question if at the endquestions
      });
    } else {
      setState(() {
        questionIndex++;
        selectedAnswers.add(answer);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //There is something called singleChildScrollView
    // It allows you to make a scrollable column
    // TextButton.icon() is used to create a button with an icon and text
    return (questionIndex != -1)
        ? Container(
            margin: EdgeInsets.all(40),
            child: Center(
              child: Column(
                //Question and answer of question index
                mainAxisSize: MainAxisSize.min,
                //use maximum row
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  //move to next line if question is too long
                  Text(
                    questions[questionIndex].question,
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ...(() {
                    //By doing this, original order of answers is preserved
                    // because .shuffle() randomizes the order
                    // List.of creates a copy of the original list
                    final answers = List.of(questions[questionIndex].answers);
                    answers.shuffle();
                    return answers.map((answer) {
                      return ElevatedButton(
                        onPressed: () => moveToNextQuestion(answer: answer),
                        child: Text(answer),
                      );
                    }).toList();
                  })(),
                ],
              ),
            ),
          )
        : Container(
            margin: const EdgeInsets.all(40),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //print all questions with chosen answer
                  for (int i = 0; i < questions.length; i++)
                    Column(
                      children: [
                        Text(
                          'Q: ${questions[i].question}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'A: ${selectedAnswers[i]} ',
                          style: TextStyle(
                            color: selectedAnswers[i] == questions[i].answers[0]
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        selectedAnswers[i] == questions[i].answers[0]
                            ? Text(
                                "${selectedAnswers[i]} is Correct",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              )
                            : Text(
                                "${selectedAnswers[i]} is Wrong. The correct answer is ${questions[i].answers[0]}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                        if (i != questions.length) const SizedBox(height: 40),
                        if (i == questions.length - 1) ...[
                          ElevatedButton(
                            onPressed: startOver,
                            child: const Text('Start over'),
                          ),
                        ],
                      ],
                    ),
                ],
              ),
            ),
          );
  }
}
