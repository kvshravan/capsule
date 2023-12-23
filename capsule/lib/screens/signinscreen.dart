import 'dart:math';

import 'package:capsule/auth/loginFunctions.dart';
import 'package:capsule/backend/capsule.dart';
import 'package:capsule/backend/users.dart';
import 'package:capsule/common/bottomsheets.dart';
import 'package:capsule/screens/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:capsule/constants.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        title: Text(''),
        iconTheme: IconThemeData(color: Colors.white), // Icon color
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blueAccent, Colors.black87],
                    begin: const FractionalOffset(0, 1),
                    end: const FractionalOffset(0, 0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.repeated)),
          ),
          // Login content
          Container(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.all(8),
                        //   child: Container(
                        //     width: 100,
                        //     height: 100,
                        //     decoration: const BoxDecoration(
                        //         image: DecorationImage(
                        //             image: AssetImage("assets/capsulelow1.png"),
                        //             fit: BoxFit.contain)),
                        //   ),
                        // ),
                        Text(
                          'Login to Capsule.',
                          style: whiteboldtextStyle,
                        ),
                        SizedBox(height: 30),
                        // Username TextField
                    
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          style: whitetextStyle,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .white38), // Border color when not focused
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .white), // Border color when focused
                            ),
                          ),
                        ),

                        SizedBox(height: 15),

                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          style: whitetextStyle,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .white38), // Border color when not focused
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .white), // Border color when focused
                            ),
                          ),
                        ),
     
                        SizedBox(height: 30),
                        // Login Button
                        ElevatedButton(
                          onPressed: () async {
                            try {
                              openLoadingBottomSheet();
                              // Access text from controllers
                              String email = emailController.text.trim();
                              String password = passwordController.text.trim();
                              var errorString = await SignIn(email, password);
                              if(errorString.isNotEmpty){
                                Navigator.pop(context);
                                showSnackbar(errorString, context);
                              }
                              else{
                              Navigator.pop(context);
                              openSuccessBottomSheet();
                              // bottomsheet closing
                              Navigator.pop(context);
                              // go back to main-page
                              Navigator.pop(context);
                              }
                            } catch (e) {
                              print(e.toString());
                              showSnackbar(e.toString(), context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              foregroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 43, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                // Adjust the value for more or less curve
                              ),
                              shadowColor: Colors.blueAccent),
                          child: Text(
                            'Login',
                            style: textStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  openLoadingBottomSheet() {
    return showModalBottomSheet(
        context: context,
        isDismissible: false,
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        builder: (context) {
          return loadingBottomSheetWrapper('Logging In...');
        });
  }

  openSuccessBottomSheet() {
    return showModalBottomSheet(
        context: context,
        isDismissible: false,
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        builder: (context) {
          return successBottomSheetWrapper('Successfully logged in :)');
        });
  }
}
