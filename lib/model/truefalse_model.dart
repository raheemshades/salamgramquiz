import 'package:cloud_firestore/cloud_firestore.dart';

class TrueFalse {
  TrueFalse({required this.question, required this.answer, required this.id});

  final String question;
  final bool answer;
  final String id;

  Map<String, dynamic> newComment() {
    return <String, dynamic>{
      'question': question,
      'answer': answer,
      'id': id,
    };
  }

  // ignore: sort_constructors_first
  factory TrueFalse.fromMap(Map<String, dynamic> map) {
    return TrueFalse(
      question: map['question'] ?? '',
      id: map['id'] ?? '',
      answer: map['answer'] ?? '',
    );
  }

  factory TrueFalse.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    return TrueFalse(
      question: doc.data()?['question'] ?? '',
      id: doc.data()?['id'] ?? '',
      answer: doc.data()?['answer'] ?? '',
    );
  }
}
