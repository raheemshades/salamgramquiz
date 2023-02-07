import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salamgramquiz/model/multiplequestion.dart';

Future<List<Multiquestion>> fectchmultiplequestion() async {
  // List<Object?> multiplechoice;
  final List<Multiquestion> multiplechoice = <Multiquestion>[];
  await FirebaseFirestore.instance
      .collection("multichoicequestoin")
      .get()
      .then((value) {
    print("value$value");
    final QuerySnapshot<Map<String, dynamic>> data = value;
    print("data${data.docs.length}");

    for (DocumentSnapshot<Map<String, dynamic>> element in data.docs) {
      multiplechoice.add(Multiquestion.fromDoc(element));
    }
    print(multiplechoice);
  });
  return multiplechoice;
}
