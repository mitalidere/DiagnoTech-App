import 'package:diagnotech/screens/user/navigator.dart';
import 'package:diagnotech/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../widgets/customized_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Logout extends StatelessWidget {
  const Logout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 0,
                ),
                child: Container(
                  // Set background color to black
                  decoration: BoxDecoration(
                    color: const Color(0xFF452c63),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2.5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 20, top: 30, right: 10, bottom: 30),
                    child: Center(
                      // Center the text horizontally
                      child: Text(
                        "logout",
                        style: TextStyle(
                          color: Colors
                              .white, // Set text color to white for contrast
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(left: 65, right: 65, bottom: 20, top: 15),
                child: Text("Are you sure you want to logout?",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    )),
              ),
              CustomizedButton(
                buttonText: "Yes",
                buttonColor: const Color(0xFF452c63),
                textColor: Colors.white,
                onPressed: () async {
                  // Perform the logout action here
                  await auth.signOut();
                  // Sign out from Google
                  final googleSignIn = GoogleSignIn();
                  await googleSignIn.signOut();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const WelcomeScreen()),
                    (route) =>
                        false, // Remove all existing routes from the stack
                  );
                },
              ),
              CustomizedButton(
                buttonText: "No",
                buttonColor: Colors.white,
                textColor: Colors.black,
                onPressed: () {
                  // Navigator.push(
                  //                     context,
                  //                     MaterialPageRoute(
                  //                       builder: (context) => NavigatorScreen(),
                  //                     ),
                  //                   );
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
