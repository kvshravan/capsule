import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
DatabaseReference appRef = FirebaseDatabase.instance.ref("app");
DatabaseReference capsulesRef = appRef.child("capsules");
DatabaseReference usersRef = appRef.child("users");
final capsuleNameKey = "name";

Future<void> commitCapsule(String capsuleId, var dataMap) async{
  await capsulesRef.child(capsuleId).update(dataMap);
}

Future<void> commitCapsuleUserViceversa(String capsuleId,String capsuleName, String uid, String email) async{
  await capsulesRef.child(capsuleId).child('users').update({uid:email});
  await usersRef.child(uid).child('capsules').update({capsuleId:capsuleName});
}

Future<String> queryCapsuleName(String capsuleId) async{
  final snapshot = await capsulesRef.child(capsuleId).child(capsuleNameKey).once(DatabaseEventType.value);
  if(!snapshot.snapshot.exists){
    return "";
  }
  return snapshot.snapshot.value.toString();
  

}

Future<String> generateCapsule() async{
  String capsuleId = '';
  DatabaseReference capsulesRef;
  do {
  int red = Random().nextInt(256);
  int green = Random().nextInt(256);
  int blue = Random().nextInt(256);

  capsuleId = rgbToHex(red, green, blue);
  print(capsuleId);
  capsulesRef = appRef.child("capsules").child(capsuleId);
  } while (await checkIfRefExists(capsulesRef));
  return capsuleId; 
}

String rgbToHex(int red, int green, int blue){
//   The RGB components are combined into a single integer using bitwise left shifts and bitwise OR operations.
// The expression 1 << 24 | r << 16 | g << 8 | b creates an integer where the first byte represents the alpha channel (fully opaque), the second byte represents the red component, the third byte represents the green component, and the fourth byte represents the blue component.

    return (1 << 24 | red << 16 | green << 8 | blue).toRadixString(16).substring(1).toUpperCase();
}

Future<bool> checkIfRefExists(DatabaseReference reference) async {
  print(reference);
  final snapshot = await reference.once(DatabaseEventType.value);
  print(snapshot.snapshot.exists);
  // Use the 'exists' property to check if the reference exists without reading its value
  return snapshot.snapshot.exists;
}


