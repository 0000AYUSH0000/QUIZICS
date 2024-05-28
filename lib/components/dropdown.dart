import 'package:flutter/material.dart';
import 'package:my_quiz_app/constants.dart';

class DropDowns{
  String selected_difficulty = "easy";
  int selected_category = 11;
  String selected_type = "multiple";

  List<DropdownMenuItem<String>> get difficulty_dropdown {
    return [
      const DropdownMenuItem(value: 'easy', child: Text("EASY",style: kdropdownTextStyle)),
      const DropdownMenuItem(value: 'medium', child: Text("MEDIUM",style: kdropdownTextStyle)),
      const DropdownMenuItem(value: 'hard', child: Text("HARD",style: kdropdownTextStyle)),
    ];
  }

  List<DropdownMenuItem<String>> get type_dropdown {
    return [
      const DropdownMenuItem(value: 'multiple', child: Text("MCQs",style: kdropdownTextStyle)),
      const DropdownMenuItem(value: 'boolean', child: Text("T/F",style: kdropdownTextStyle)),
    ];
  }

  List<DropdownMenuItem<int>> get category_dropdown {
    return [
      const DropdownMenuItem(value:9, child: Text("ANY",style: kdropdownTextStyle) ),
      const DropdownMenuItem(value:11, child: Text("MOVIES",style: kdropdownTextStyle) ),
      const DropdownMenuItem(value:21, child: Text("SPORTS",style: kdropdownTextStyle) ),
      const DropdownMenuItem(value:20, child: Text("MYTHOLOGY",style: kdropdownTextStyle) ),
      const DropdownMenuItem(value:24, child: Text("POLITICS",style: kdropdownTextStyle) ),
      const DropdownMenuItem(value:23, child: Text("HISTORY",style: kdropdownTextStyle) ),
    ];
  }


}