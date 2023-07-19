import 'dart:ffi';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:bonsoir/bonsoir.dart';
import 'pojo.dart';
// Future<Object> fetchImage() async {
//   final storage = FirebaseStorage.instance;
//   final storageRef = storage.ref();
//   print("result");
//   try {
//     final result = await storageRef.listAll().then((value) =>{ print("jjj")});
//     print("result");
//     return result;
//
//   } catch (e) {
//     print('Error listing files: $e');
//     return e;
//
//   }
// }
MyClass myObject = MyClass();

 void setData(amount, iscategory, payment) async {

  // DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
  // Map<String, dynamic> data = {
  //   "amount": amount,
  //   "category": iscategory.toString(),
  //   "payment": payment.toString()
  // };
  // final DateTime now = DateTime.now();
  // final int timestamp = now.millisecondsSinceEpoch;
   print("here");
// Let's create our service !
   BonsoirService service = BonsoirService(
     name: 'My wonderful service new', // Put your service name here.
     type: '_Mywonderfulservice_scanner._tcp', // Put your service type here. Syntax : _ServiceType._TransportProtocolName. (see http://wiki.ros.org/zeroconf/Tutorials/Understanding%20Zeroconf%20Service%20Types).
     port: 3030, // Put your service port here.
   );

// And now we can broadcast it :
   BonsoirBroadcast broadcast = BonsoirBroadcast(service: service);
   await broadcast.ready;
   await broadcast.start();

// ...

// Then if you want to stop the broadcast :





















  // var user = "sloth";
  // databaseReference
  //     .child('expense')
  //     .child(user)
  //     .child(timestamp.toString())
  //     .set(data)
  //     .then((value) {
  //   print('Data inserted successfully');
  //
  // }).catchError((error) {
  //   print('Failed to insert data: $error');
  // });
}

Future<String> getData() async{
  print("there");
  // This is the type of service we're looking for :
  String type = '_sftp.ssh._tcp';
  String ans="";
  List list_of_ip=[];
  int count =0;
// Once defined, we can start the discovery :
  BonsoirDiscovery discovery = BonsoirDiscovery(type: type);
  await discovery.ready;

// If you want to listen to the discovery :
   discovery.eventStream?.listen((event) {
    if (event.type == BonsoirDiscoveryEventType.discoveryServiceResolved) {
      print(count+=1);
      print('Service found c : ${event.service?.toJson()}');
      list_of_ip.add(event.service?.toJson());
      print("updated data");
      print(list_of_ip);
      myObject.data = "updated";
      Map<String,dynamic>? any  = event.service?.toJson() ;
      if(any != null)
        {
          print(any.keys);
          ans=any["service.ip"] as String;
          myObject.data=ans;

        }
    } else if (event.type == BonsoirDiscoveryEventType.discoveryServiceLost) {
      print('Service lost : ${event.service?.toJson()}');
    }
  });

// Start discovery **after** having listened to discovery events
  await discovery.start();
print(discovery.toJson());
  return myObject.data;

// Then if you want to stop the discovery :

  // print("get data");
  // DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
  // databaseReference
  //     .child('expense')
  //     .child("sloth")
  //     .get()
  //     .then((value) {
  //
  //
  //     print(value);
  //
  //
  // }).catchError((error) {
  //   print('Failed to insert data: $error');
  // });
}


