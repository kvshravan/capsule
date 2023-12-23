import 'package:firebase_auth/firebase_auth.dart';

Future<String> SignIn(String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(), password: password.trim());
          final uid = FirebaseAuth.instance.currentUser?.uid;
    print(uid);
  } catch (e) {
    return e.toString();
  }
  return "";
}

Future<String> SignUp(String email, String password, String confirmPassword) async {
  email = email.trim();
  password = password.trim();
  confirmPassword = confirmPassword.trim();
  if(email.isEmpty || password.isEmpty || confirmPassword.isEmpty){
    return "Please fill all the fields.";
  }
  if (password.trim() != confirmPassword.trim()) {
    return "Passwords Must Match";
  }
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim()
        );
    final uid = FirebaseAuth.instance.currentUser?.uid;
    print(uid);
  } catch (e) {
    return e.toString();
  }
  return "";
}

Future<String> signOut() async{
  try{
  await FirebaseAuth.instance.signOut();
  }
  catch(e){
    return e.toString();
  }
  return "";
}