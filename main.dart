import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlashcardQuiz(),
    );
  }
}

class FlashcardQuiz extends StatefulWidget {
  @override
  _FlashcardQuizState createState() => _FlashcardQuizState();
}

class _FlashcardQuizState extends State<FlashcardQuiz> {
  List<Map<String, dynamic>> quizData = [
    {'question': 'What is the capital of France?', 'answer': 'Paris'},
    {'question': 'Who is the president of the United States?', 'answer': 'Joe Biden'},
    {'question': 'What is the largest mammal?', 'answer': 'Blue Whale'},
    {'question': 'In which year did World War II end?', 'answer': '1945'},
    {'question': 'What is the currency of Japan?', 'answer': 'Japanese Yen'},
  ];

  int currentIndex = 0;
  bool showAnswer = false;

  List<Color> cardColors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.red,
  ];

  void showHideAnswer() {
    setState(() {
      showAnswer = !showAnswer;
    });
  }

  void nextQuestion() {
    setState(() {
      currentIndex = (currentIndex + 1) % quizData.length;
      showAnswer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flashcard Quiz App'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: cardColors[currentIndex],
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                quizData[currentIndex]['question'],
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  showHideAnswer();
                },
                child: Text(showAnswer ? 'Hide Answer' : 'Show Answer'),
              ),
              SizedBox(height: 20),
              if (showAnswer)
                Text(
                  quizData[currentIndex]['answer'],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  nextQuestion();
                },
                child: Text('Next Question'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
