import 'package:flutter/material.dart';
import 'package:my_quiz_app/components/dropdown.dart';
import 'package:my_quiz_app/networking.dart';
import 'package:my_quiz_app/screens/quiz_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DropDowns dropDowns = DropDowns();
  int amount = 5;
  DataGetter dataGetter = DataGetter();
  dynamic questions;
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
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Column(
            children: [
              const Text(
                'COOK',
                style: TextStyle(
                  fontFamily: 'PermanentMarker',
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyanAccent,
                ),
              ),
              const Text(
                'YOUR',
                style: TextStyle(
                  fontFamily: 'PermanentMarker',
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.orangeAccent,
                ),
              ),
              const Text(
                'QUIZ',
                style: TextStyle(
                  fontFamily: 'PermanentMarker',
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.greenAccent,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'AMOUNT',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 25),
              ),
              Text(
                amount.toString(),
                style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 35,
                    fontWeight: FontWeight.w900),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: Slider(
                    activeColor: Colors.pinkAccent,
                    inactiveColor: Colors.white,
                    value: amount.toDouble(),
                    min: 5,
                    max: 30,
                    onChanged: (double newvalue) {
                      setState(() {
                        amount = newvalue.round();
                      });
                    }),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // First dropdown
                  DropdownButton(
                    alignment: AlignmentDirectional.topStart,
                    value: dropDowns.selected_difficulty,
                    items: dropDowns.difficulty_dropdown,
                    onChanged: (newValue) {
                      setState(() {
                        dropDowns.selected_difficulty = newValue!;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  DropdownButton(
                    alignment: AlignmentDirectional.topStart,
                    value: dropDowns.selected_type,
                    items: dropDowns.type_dropdown,
                    onChanged: (newValue) {
                      setState(() {
                        dropDowns.selected_type = newValue!;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  SingleChildScrollView(
                    child: DropdownButton(
                      alignment: AlignmentDirectional.topStart,
                      value: dropDowns.selected_category,
                      items: dropDowns.category_dropdown,
                      onChanged: (newValue) {
                        setState(() {
                          dropDowns.selected_category = newValue!;
                        });
                      },
                      menuMaxHeight: 150,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 90,
              ),
              ElevatedButton(
                style: const ButtonStyle(),
                onPressed: () async {
                  try {
                     const SpinKitDoubleBounce(
                      color: Colors.orangeAccent,
                      size: 50.0,
                    );
                    if (dropDowns.selected_category == 0) {
                      if (dropDowns.selected_type == 'boolean') {
                        questions = await dataGetter.getTriviaData(
                          amount: amount,
                          type: dropDowns.selected_type,
                        );
                      } else {
                        questions = await dataGetter.getTriviaData(
                          amount: amount,
                          difficulty: dropDowns.selected_difficulty,
                          type: dropDowns.selected_type,
                        );
                      }
                    } else {
                      if (dropDowns.selected_type == 'boolean') {
                        questions = await dataGetter.getTriviaData(
                          amount: amount,
                          category: dropDowns.selected_category,
                          type: dropDowns.selected_type,
                        );
                      } else {
                        questions = await dataGetter.getTriviaData(
                          amount: amount,
                          category: dropDowns.selected_category,
                          difficulty: dropDowns.selected_difficulty,
                          type: dropDowns.selected_type,
                        );
                      }
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizScreen(
                          data: questions,
                          amount: amount,
                          type: dropDowns.selected_type,
                        ),
                      ),
                    );
                  } catch (e) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('OOPS!',style: TextStyle(fontFamily: 'Poppins'),),
                          content: Text(
                            'We dont have $amount questions matching your combination,try setting a lower amount.',
                            style: const TextStyle(fontFamily: 'Poppins'),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OKAY'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text('GET STARTED',
                    style: TextStyle(fontFamily: 'Poppins')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
