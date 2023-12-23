import 'package:capsule/auth/loginFunctions.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child:MaterialButton(onPressed: (){
          signOut();
        }
        ,
        child: Text('Logout'),
        )

      ),
    );
  }
}