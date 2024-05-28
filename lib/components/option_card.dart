import 'dart:core';
import 'package:flutter/material.dart';
import 'package:my_quiz_app/constants.dart';

class OptionCard extends StatefulWidget {
  OptionCard({required this.option_text,required this.card_color});
  final String option_text;
  final Color card_color;

  @override
  State<OptionCard> createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  @override
  void initState() {
    super.initState();
    updateUI(widget.option_text,widget.card_color);
  }
  String text='';
  Color color=Colors.black87;
  void updateUI(String option_text,Color card_color){
     text= option_text;
     color=card_color;
  }
  @override
  Widget build(BuildContext context) {
    updateUI(widget.option_text,widget.card_color);
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.all(10),
      width: 270,
      height: 65,
      child: Center(child: Text(text,textAlign: TextAlign.center,style: koptionCardTextStyle,)),
    );
  }
}
