import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Listmodel {
  final DocumentReference reference;
  String title;
  bool isDone;

//  Listmodel(this.reference, {
//    @required this.title,
//  });

  Listmodel(this.title, {this.isDone = false, this.reference});

  Listmodel.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['title'] != null),
        assert(map['isDone'] != null),
        title = map['title'],
        isDone = map['isDone'];

  Listmodel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
