import 'package:flutter/cupertino.dart';

import '../database/multiquestion.dart';
import '../model/multiplequestion.dart';

class MultipleChoiceprovider extends ChangeNotifier {
  int _count = 1;
  List<Multiquestion> multiplechoice = <Multiquestion>[];
  double? score;

  int? questionlenght;

  var multiplequestion;
  String? chosenvalue;
  Map answers = {};
  List<Map> answer = [];

  int get count => _count;

  void increment() {
    if (_count < questionlenght!) {
      _count++;
      notifyListeners();
    }
  }

  void setcount(int a) {
    _count = a;
    notifyListeners();
  }

  Future<void> fetchdata() async {
    multiplechoice = await fectchmultiplequestion();
    questionlenght = multiplechoice.length;
    print("from fetch $multiplequestion");
    print("from fetch $questionlenght");
    notifyListeners();
  }

  void decreament() {
    if (_count > 0) {
      _count--;
      notifyListeners();
    }
  }

  void setscore(double value) {
    score = value;
    print("score$score");
    notifyListeners();
  }
}
