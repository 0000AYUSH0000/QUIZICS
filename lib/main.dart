import 'package:flutter/material.dart';
import 'components/dropdown.dart';
import 'screens/home_screen.dart';

void main() => runApp(const MyQuizApp());

class MyQuizApp extends StatefulWidget {
  const MyQuizApp({super.key});

  @override
  State<MyQuizApp> createState() => _MyQuizAppState();
}

class _MyQuizAppState extends State<MyQuizApp> {


DropDowns dropDowns=DropDowns();
int amount=5;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home:  const HomeScreen()
    );
  }
}
