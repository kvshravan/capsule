import 'package:capsule/backend/capsule.dart';
import 'package:flutter/material.dart';
import 'package:capsule/constants.dart';

class CreateCapsulePage extends StatefulWidget {
  @override
  State<CreateCapsulePage> createState() => _CreateCapsulePageState();
}

class _CreateCapsulePageState extends State<CreateCapsulePage> {
  final TextEditingController capsuleNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
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
                          'Create, Join Capsule.',
                          style: whiteboldtextStyle,
                        ),
                        SizedBox(height: 30),
                        // Username TextField
                        TextField(
                          textCapitalization: TextCapitalization.words,
                          controller: capsuleNameController,
                          style: whitetextStyle,
                          decoration: InputDecoration(
                            labelText: 'Capsule Name',
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
                        SizedBox(
                          height: 15,
                        ),
                        // Password TextField
                        TextField(
                          controller: confirmPasswordController,
                          obscureText: true,
                          style: whitetextStyle,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
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
                          onPressed: () {
                            // Access text from controllers
                            String capsuleName = capsuleNameController.text;
                            String email = emailController.text;
                            String password = passwordController.text;
                            String confirmPassword = confirmPasswordController.text;
                            generateCapsule();
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
                            'Create and Join Capsule!',
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
}
