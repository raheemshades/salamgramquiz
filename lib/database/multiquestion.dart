import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salamgramquiz/model/MQ_model.dart';

Future<List<Multiquestion>> fectchmultiplequestion() async {
  // List<Object?> multiplechoice;
  final List<Multiquestion> multiplechoice = <Multiquestion>[];
  await FirebaseFirestore.instance
      .collection("multichoicequestoin")
      .get()
      .then((value) {
    final QuerySnapshot<Map<String, dynamic>> data = value;

    for (DocumentSnapshot<Map<String, dynamic>> element in data.docs) {
      multiplechoice.add(Multiquestion.fromDoc(element));
    }
  });
  return multiplechoice;
}
