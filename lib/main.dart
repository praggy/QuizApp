import 'package:flutter/material.dart';
import 'package:quiz_app/model/question.dart';
void main() {
  runApp(new MaterialApp(
    home: QuizApp()
  ));
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;
  List questionBank = [
    Question.name("The capital of Libya is Benghazi.", false),
    Question.name(
        "Albert Einstein was awarded the Nobel Prize in Physics.", false),
    Question.name("Baby koalas are called joeys.", false),
    Question.name(
        "Gone with the Wind takes place in Savannah, Georgia.", false),
    Question.name(
        "Brazil is the only country in the Americas whose official language is Portuguese.",
        false),
    Question.name("The first name of Kramer in Seinfeld is Cosmo.", false),
    Question.name("The American Civil War ended in 1776.", false),
    Question.name("A right triangle can never be equilateral.", false),
    Question.name("The Ford Edsel was named after Henry Ford’s father.", false),
    Question.name(
        "The Bill of Rights contains 10 amendments to the Constitution.",
        false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(
            child: Text(
              "Quiz App",
              style: TextStyle(fontSize: 25, color: Colors.white),
            )),
      ),
      body: Builder(
        builder:(BuildContext context) =>Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Image.asset(
                "images/flag.png",
                width: 250,
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 1.5, color: Colors.blueGrey.shade400)),
                  child: Column(
                    children: <Widget>[
                      Center(
                          child: Text(
                            "Question",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Center(
                            child: Text(
                                questionBank[_currentQuestionIndex].questionText,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white))),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => _prevQuestion(),
                    child: Icon(Icons.arrow_back),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(true, context),
                    child: Text("True"),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(false, context),
                    child: Text("False"),
                  ),
                  RaisedButton(
                    onPressed: () => _nextQuestion(),
                    child: Icon(Icons.arrow_forward),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool selectedOption, BuildContext context) {
    if (selectedOption == questionBank[_currentQuestionIndex].isCorrect) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text("Correct Answer"),backgroundColor: Colors.green,duration: Duration(seconds: 1)));
      _updateQuestion();
    }
    else {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text("Wrong Answer"),backgroundColor: Colors.redAccent,duration: Duration(seconds: 1)));
      _updateQuestion();
    }
  }

  _prevQuestion()
  {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }

  _nextQuestion() {
    _updateQuestion();

  }

  void _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }
}