// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:salamgramquiz/database/truefalse.dart';
import 'package:salamgramquiz/model/TF_model.dart';

class TFProvider extends ChangeNotifier {
  int _count = 1;
  int questionlenght = 0;
  List<TrueFalse> truefalse = <TrueFalse>[];
  List<TrueFalse> ans = <TrueFalse>[];
  List<bool> trueansindex = [];

  List<TrueFalse> multiplequestion = <TrueFalse>[];
  List<Map> answer = [];
  double? score;
  // bool? trueorfalseans;
  Map answers = {};

  int get count => _count;
  void setcount(int val) {
    _count = val;
    notifyListeners();
  }

  List<Map> getanswer() {
    return answer;
  }

  void increment() {
    if (_count < questionlenght) {
      _count++;
      notifyListeners();
    }
  }

  void setscore(double value) {
    score = value;
    notifyListeners();
  }

  void decreament() {
    if (_count > 0) {
      _count--;
      notifyListeners();
    }
  }

  Future<void> fetchdata() async {
    truefalse = await fectchtruefalsequestion();
    questionlenght = truefalse.length;

    notifyListeners();
  }
}
