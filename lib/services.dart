// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'firebase_options.dart';
//
// class FirebaseServices {
//    FirebaseServicesInit() async {
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
//   }
//   FirebaseDatabase database = FirebaseDatabase.instance;
//
//   setData(name) async{
//     print('SetData');
//     DatabaseReference ref = FirebaseDatabase.instance.ref();
//     print(ref);
//     await ref.child("https://bolt-e5661-default-rtdb.firebaseio.com/test").set({
//       "name": name,
//       "age": 50,
//       "address": {
//         "line1": "100 Mountain View"
//       }
//     });
//   }
// }