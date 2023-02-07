import 'package:flutter/cupertino.dart';
import 'package:salamgramquiz/database/truefalse.dart';
import 'package:salamgramquiz/model/truefalse_model.dart';

class truefalseprovider extends ChangeNotifier {
  int _count = 1;
  int questionlenght = 0;
  List<TrueFalse> truefalse = <TrueFalse>[];
  var multiplequestion;
  List<Map> answer = [];
  double? score;
  bool? trueorfalseans;
  Map answers = {};

  int get count => _count;

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

    print("from fetch $multiplequestion");
    print("from fetch $questionlenght");
    notifyListeners();
  }

  void trueorfalse(bool ans) {
    trueorfalseans = ans;
    notifyListeners();
  }
}
