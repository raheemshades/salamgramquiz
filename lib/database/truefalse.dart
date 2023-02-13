import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/TF_model.dart';

Future<List<TrueFalse>> fectchtruefalsequestion() async {
  // List<Object?> truefalse;
  final List<TrueFalse> truefalse = <TrueFalse>[];
  await FirebaseFirestore.instance.collection("Truefalse").get().then((value) {
    final QuerySnapshot<Map<String, dynamic>> data = value;

    for (DocumentSnapshot<Map<String, dynamic>> element in data.docs) {
      truefalse.add(TrueFalse.fromDoc(element));
    }
  });
  return truefalse;
}
