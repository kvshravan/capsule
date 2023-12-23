import 'package:capsule/auth/loginFunctions.dart';
import 'package:flutter/material.dart';
import 'package:capsule/constants.dart';
import 'createcapsule.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController capsuleCodeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blueAccent, Colors.black87],
                    begin: const FractionalOffset(0, 0),
                    end: const FractionalOffset(0, 1),
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
                          'Capsule.\nVibe and Trust matter.',
                          style: whiteboldtextStyle,
                        ),
                        SizedBox(height: 30),
                        // Username TextField
                        TextField(
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
                        SizedBox(height: 15),
                        // Password TextField
                        TextField(
                          controller: capsuleCodeController,
                          textCapitalization: TextCapitalization.characters,
                          obscureText: false,
                          style: whitetextStyle,
                          decoration: InputDecoration(
                            labelText: 'Capsule code',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .white), // Border color when not focused
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .blueAccent), // Border color when focused
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              " No capsule code?",
                              style: whitethinStyle,
                            ),
                            TextButton(
                              onPressed: () {
                                // Navigate to CreateCapsulePage when the button is pressed
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        CreateCapsulePage(),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      const begin = Offset(1.0, 0.0);
                                      const end = Offset.zero;
                                      const curve = Curves.easeInOut;
                                      var tween = Tween(begin: begin, end: end)
                                          .chain(CurveTween(curve: curve));
                                      var offsetAnimation =
                                          animation.drive(tween);
                                      return SlideTransition(
                                        position: offsetAnimation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                "Create capsule.",
                                style: bluethinStyle,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              " Already a member?",
                              style: whitethinStyle,
                            ),
                            TextButton(
                              onPressed: () {
                                // Navigate to CreateCapsulePage when the button is pressed
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        CreateCapsulePage(),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      const begin = Offset(1.0, 0.0);
                                      const end = Offset.zero;
                                      const curve = Curves.easeInOut;
                                      var tween = Tween(begin: begin, end: end)
                                          .chain(CurveTween(curve: curve));
                                      var offsetAnimation =
                                          animation.drive(tween);
                                      return SlideTransition(
                                        position: offsetAnimation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                "Sign In.",
                                style: bluethinStyle,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 35),
                        // Login Button
                        ElevatedButton(
                          onPressed: () async {
                            // Implement your login logic here
                            String email = emailController.text;
                            String password = passwordController.text;
                            String confirmPassword =
                                confirmPasswordController.text;
                            String errorString =
                                await SignUp(email, password, confirmPassword);
                            if (errorString.isNotEmpty) {
                              showSnackbar(errorString, context);
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
                            'Join Capsule!',
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

void showSnackbar(message, BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(SnackBar(content: Text(message)));
}
