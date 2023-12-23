import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
final appRef = FirebaseDatabase.instance.ref("app");


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
  print(['Created a capsule Id',capsuleId]);
  return capsuleId; 
}

String rgbToHex(int red, int green, int blue){
//   The RGB components are combined into a single integer using bitwise left shifts and bitwise OR operations.
// The expression 1 << 24 | r << 16 | g << 8 | b creates an integer where the first byte represents the alpha channel (fully opaque), the second byte represents the red component, the third byte represents the green component, and the fourth byte represents the blue component.

    return '#${(1 << 24 | red << 16 | green << 8 | blue).toRadixString(16).substring(1)}';
}

Future<bool> checkIfRefExists(DatabaseReference reference) async {
  print(reference);
  final snapshot = await reference.once(DatabaseEventType.value);
  print(snapshot.snapshot.exists);
  // Use the 'exists' property to check if the reference exists without reading its value
  return snapshot.snapshot.exists;
}