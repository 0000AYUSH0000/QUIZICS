import 'package:flutter/material.dart';
import 'package:my_quiz_app/components/option_card.dart';
import 'package:my_quiz_app/constants.dart';
import 'package:my_quiz_app/quiz_brain.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen(
      {super.key, required this.data, required this.amount, required this.type});
  final int amount;
  final dynamic data;
  final String type;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  QuizBrain quizBrain=QuizBrain();
  int score = 0;
  late String type;
  bool is_option_selected = false;
  int currentQuestionIndex = -1;
  late Map<String, dynamic> questionData;
  late String question;
  late String correctAnswer;
  late List<String> incorrectAnswers;
  late List<String> allOptions;
  late int last_question_index;
  List<Color> card_color = [
    knormalCardColour,
    knormalCardColour,
    knormalCardColour,
    knormalCardColour
  ];
  int correct_answer_index = 0;
  @override
  void initState() {
    super.initState();
    updateUI();
  }

  void updateUI() {
    last_question_index = widget.amount - 1;
    type = widget.type;
    currentQuestionIndex++;
    questionData = widget.data[currentQuestionIndex];
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
      score++;
      is_option_selected = true;
    } else {
      card_color[i] = kwrongCardColour;
      card_color[correct_answer_index] = kcorrectCardColour;
      is_option_selected = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: const Icon(Icons.quiz_outlined),
        title: const Text(
          'QUIZICS',
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding:(type!='boolean') ? const EdgeInsets.fromLTRB(16 ,55, 16, 16): const EdgeInsets.fromLTRB(16 ,120, 16, 16),
          child: Column(
            children: [
              Text(
                question,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                  onTap: is_option_selected
                      ? null
                      : () {
                          setState(() {
                            showAnswer(0);
                          });
                        },
                  child: OptionCard(
                      option_text: allOptions[0], card_color: card_color[0])),
              InkWell(
                  onTap: is_option_selected
                      ? null
                      : () {
                          setState(() {
                            showAnswer(1);
                          });
                        },
                  child: OptionCard(
                      option_text: allOptions[1], card_color: card_color[1])),
              if (type != 'boolean')
                InkWell(
                    onTap: (is_option_selected )
                        ? null
                        : () {
                            setState(() {
                              showAnswer(2);
                            });
                          },
                    child: OptionCard(
                        option_text: allOptions[2], card_color: card_color[2])),
              if (type != 'boolean')
                InkWell(
                    onTap: (is_option_selected )
                        ? null
                        : () {
                            setState(() {
                              showAnswer(3);
                            });
                          },
                    child: OptionCard(
                        option_text: allOptions[3], card_color: card_color[3])),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed:(!is_option_selected )
                 ? null: () {
                  setState(() {
                    if (currentQuestionIndex == last_question_index) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            score: score,
                            amount: last_question_index + 1,
                          ),
                        ),
                      );
                    } else {
                      updateUI();
                    }
                  });
                },
                child: Text(
                  (currentQuestionIndex == last_question_index)
                      ? 'GET RESULTS'
                      : 'NEXT',
                  style: const TextStyle(fontFamily: 'Poppins', color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
