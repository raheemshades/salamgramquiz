// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class Multiquestion {
  Multiquestion(
      {required this.question,
      required this.id,
      required this.rightanswer,
      required this.options});

  final String question;
  final String id;

  final String rightanswer;
  final List<String>? options;

  Map<String, dynamic> newComment() {
    return <String, dynamic>{
      'question': question,
      'id': id,
      'Rightanswer': rightanswer,
      'options': options ?? <String>[],
    };
  }

  // ignore: sort_constructors_first
  factory Multiquestion.fromMap(Map<String, dynamic> map) {
    return Multiquestion(
      question: map['question'] ?? '',
      id: map['id'] ?? '',

      rightanswer: map['Rightanswer'] ?? '',
      options: map['options'] ?? '',

      // option: map['option'] ?? '',
    );
  }

  factory Multiquestion.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    return Multiquestion(
      question: doc.data()?['question'] ?? '',
      id: doc.data()?['id'] ?? '',

      rightanswer: doc.data()?['Rightanswer'] ?? '',
      options: List<String>.from(doc.data()?['options'] ?? <String>[]),

      // option: doc.data()?['option'] ?? '',
    );
  }
}
