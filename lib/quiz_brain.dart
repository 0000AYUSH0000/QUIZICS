import 'package:flutter/material.dart';
import 'constants.dart';

class QuizBrain{
  bool is_option_selected = false;
  int currentQuestionIndex = -1;
  late Map<String, dynamic> questionData;
  late String question;
  late String correctAnswer;
  late List<String> incorrectAnswers;
  late List<String> allOptions;
  List<Color> card_color = [
    knormalCardColour,
    knormalCardColour,
    knormalCardColour,
    knormalCardColour
  ];
  int correct_answer_index = 0;

  void updateUI(dynamic questionData) {
    currentQuestionIndex++;
    question = questionData['question'];
    correctAnswer = questionData['correct_answer'];
    incorrectAnswers = List<String>.from(questionData['incorrect_answers']);
    allOptions = []
      ..add(correctAnswer)
      ..addAll(incorrectAnswers);
    allOptions.shuffle();
    correct_answer_index =
        allOptions.indexWhere((item) => item == correctAnswer);
    card_color = [
      knormalCardColour,
      knormalCardColour,
      knormalCardColour,
      knormalCardColour
    ];
    is_option_selected = false;
  }

  void showAnswer(int i) {
    if (i == correct_answer_index) {
      card_color[i] = kcorrectCardColour;
      is_option_selected = true;
    } else {
      card_color[i] = kwrongCardColour;
      card_color[correct_answer_index] = kcorrectCardColour;
      is_option_selected = true;
    }
  }
}