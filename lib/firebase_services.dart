import 'dart:ffi';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';


void setData(amount, iscategory, payment) {
  print(iscategory);
  DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
  Map<String, dynamic> data = {
    "amount": amount,
    "category": iscategory.toString(),
    "payment": payment.toString()
  };
  final DateTime now = DateTime.now();
  final int timestamp = now.millisecondsSinceEpoch;

  var user = "sloth";
  databaseReference
      .child('expense')
      .child(user)
      .child(timestamp.toString())
      .set(data)
      .then((value) {
    print('Data inserted successfully');

  }).catchError((error) {
    print('Failed to insert data: $error');
  });
}
