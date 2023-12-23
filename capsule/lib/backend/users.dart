
import 'package:firebase_database/firebase_database.dart';
final appRef = FirebaseDatabase.instance.ref("app");

Future<void> commitUser(String uid, var dataMap) async{
  await appRef.child('users').child(uid).set(dataMap);
}