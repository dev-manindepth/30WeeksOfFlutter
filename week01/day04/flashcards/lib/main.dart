import 'package:flashcards/flashcard.dart';
import 'package:flashcards/flashcard_view.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<FlashCard> _flashcard = [
    FlashCard(
        question: "What programming lanugage does flutter use", answer: "Dart"),
    FlashCard(question: "Which is full form of www ", answer: "World Wide Web"),
    FlashCard(
        question: "What teaches you how to code ",
        answer: "Entire Internet Community")
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: FlipCard(
                    front: FlashcardView(
                      text: _flashcard[_currentIndex].question,
                    ),
                    back:
                        FlashcardView(text: _flashcard[_currentIndex].answer)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlineButton.icon(
                    onPressed: showPrevCard,
                    icon: Icon(Icons.chevron_left),
                    label: Text("Prev"),
                  ),
                  OutlineButton.icon(
                    onPressed: showNextCard,
                    icon: Icon(Icons.chevron_right),
                    label: Text("Next"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void showNextCard() {
    setState(() {
      _currentIndex = (_currentIndex+1 < _flashcard.length) ? _currentIndex + 1 : 0;
    });
  }

  void showPrevCard() {
    setState(() {
       _currentIndex = (_currentIndex-1 >= 0 ) ? _currentIndex - 1 : _flashcard.length-1;
    });
   
  }
}
